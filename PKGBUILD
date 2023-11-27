# Maintainer: zotan <aur@zotan.email>

pkgname=iceshrimp-pre
pkgver=v2023.12.pre3
pkgrel=1
pkgdesc="YAMF (Yet another Misskey fork) bringing you no-nonsense fixes, features & improvements you actually want since 2023"
arch=(x86_64 aarch64)
url="https://iceshrimp.dev/iceshrimp/iceshrimp"
license=(AGPL3)

makedepends=(makepkg-git-lfs-proto npm)
depends=(nodejs redis postgresql)
optdepends=(
  "ffmpeg: for video transcoding"
)

conflicts=(iceshrimp)
provides=(iceshrimp)

backup=("etc/iceshrimp/configuration.yml")

install="iceshrimp.install"

source=(
  "iceshrimp::git-lfs+https://iceshrimp.dev/iceshrimp/iceshrimp.git#tag=${pkgver/.pre/-pre}"
  "iceshrimp.service"
  "iceshrimp.sysusers"
  "iceshrimp.tmpfiles"
  "iceshrimp.install"
  "iceshrimp.hook"
)

sha512sums=('SKIP'
            '3b545a3c5a76d0ef1f4f3189ff7d8c61bc711ff3543d345c8bae2c6e10367dbd1302ef1890bc3d799403946ce65db20336752873334c6c106707e293821861fb'
            '9adf1781842ae7ff2779ca561f06ab2b6fb93e206698084283986627aba69b0fd4482ccbed3daebb2517e5966c326604e1cc57618589f331a966fee2db63815d'
            '124e932244a403733e20e63b1e1dbf59afc90e3bd8240c314c6ecd2c8ffe8c5fade5e20b6755de9e68a76e99eacbaafa42bfb367caa5f13638857a4147af8795'
            '36980c4f5a6d25d4f522ccd64aaf38c3d704c29a25b834b14135e2895f55318496fbaf269e589e4eabbf5495265682d6f58b966ce8b70f52190dccf7a18f44cc'
            '130d1b1aae460ddb082d945b525fb046dcaa9084622b6daebff3f1cd9c8d4cc7dc7b68959a5487cfc0df91641c5423dccc723152726980b7230c2134f7bf2a6a')

build() {
  cd "${srcdir}/iceshrimp"

  # Fix node-re2 build
  export CXXFLAGS="${CXXFLAGS/-fno-plt/}"
  export CXXFLAGS="${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  export NODE_ENV="production"

  corepack yarn install --immutable
  corepack yarn build
  corepack yarn focus-production
}

package() {
  install -dm 755 "${pkgdir}/usr/share/iceshrimp"
  install -dm 755 "${pkgdir}/etc/iceshrimp"
  install -Dm 644 "${srcdir}/iceshrimp/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm 644 "${srcdir}/iceshrimp.service" "${pkgdir}/usr/lib/systemd/system/iceshrimp.service"
  install -Dm 644 "${srcdir}/iceshrimp.sysusers" "${pkgdir}/usr/lib/sysusers.d/iceshrimp.conf"
  install -Dm 644 "${srcdir}/iceshrimp.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/iceshrimp.conf"
  install -Dm 644 "${srcdir}/iceshrimp.hook" "${pkgdir}/usr/share/libalpm/hooks/iceshrimp.hook"
  install -Dm 640 "${srcdir}/iceshrimp/.config/example.yml" "${pkgdir}/etc/iceshrimp/configuration.yml"

  find "${srcdir}/iceshrimp/.yarn/unplugged" -path "*/re2/build/Makefile" -or -path "*/re2/build/config.gypi" | xargs -r sed -i "s%${srcdir}%/usr/share%g"

  cp -dpTr --no-preserve=ownership "${srcdir}/iceshrimp/" "${pkgdir}/usr/share/iceshrimp"

  rm -rf "${pkgdir}/usr/share/iceshrimp/.git"
  rm -rf "${pkgdir}/usr/share/iceshrimp/packages"/{backend,client}/"src"
}
