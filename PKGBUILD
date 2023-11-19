# Maintainer: zotan <aur@zotan.email>

pkgname=iceshrimp-git
pkgver=v2023.11.3.r25.g4c12a8882
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
  "iceshrimp::git-lfs+https://iceshrimp.dev/iceshrimp/iceshrimp.git#branch=dev"
  "iceshrimp.service"
  "iceshrimp.sysusers"
  "iceshrimp.tmpfiles"
  "iceshrimp.install"
  "iceshrimp.hook"
)

sha512sums=('SKIP'
            'd35b085754e8a03447f8d17fae1649b432709d2d5fe9149ec95e3d5b3857efd6d65021efb483ed91711f5a73ad2a02d12e4d885a660418fa0cd16541aa830153'
            '9adf1781842ae7ff2779ca561f06ab2b6fb93e206698084283986627aba69b0fd4482ccbed3daebb2517e5966c326604e1cc57618589f331a966fee2db63815d'
            '2c148ad7606b0ffc40526d682e2b419de46e4b3d6258240e5664774e41c872747daa7aaa39a58b63c590dba0fb2259cbed06746bffb6da78d25eb8b23f32e512'
            '36980c4f5a6d25d4f522ccd64aaf38c3d704c29a25b834b14135e2895f55318496fbaf269e589e4eabbf5495265682d6f58b966ce8b70f52190dccf7a18f44cc'
            'fab724bc864e74b1eab21941171beaa70b1c17b7719bb9a63aea1ad0f0c3e84e9b73260ad93bddd2e2f23ed6464a4d156b1659b4a7c0a032c1a31ff3e4113f7d')

pkgver() {
  cd "${srcdir}/iceshrimp"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/iceshrimp"

  # Fix node-re2 build
  export CXXFLAGS="${CXXFLAGS/-fno-plt/}"
  export CXXFLAGS="${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  export NODE_ENV="production"

  corepack yarn install --immutable
  corepack yarn regen-version
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
  ln -s "/etc/iceshrimp/configuration.yml" "${pkgdir}/usr/share/iceshrimp/.config/default.yml"
  ln -s "/var/lib/iceshrimp/files" "${pkgdir}/usr/share/iceshrimp/files"
  ln -s "/var/lib/iceshrimp/.cache" "${pkgdir}/usr/share/iceshrimp/.cache"

  rm -rf "${pkgdir}/usr/share/iceshrimp/.git"
  rm -rf "${pkgdir}/usr/share/iceshrimp/packages"/{backend,client}/"src"
}
