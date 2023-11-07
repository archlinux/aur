# Maintainer: zotan <aur@zotan.email>

pkgname=iceshrimp-git
pkgver=v2023.11.1.r9.g5f5a921b4
pkgrel=2
pkgdesc="YAMF (Yet another Misskey fork) bringing you no-nonsense fixes, features & improvements you actually want since 2023"
arch=(x86_64 aarch64)
url="https://iceshrimp.dev/iceshrimp/iceshrimp"
license=(AGPL3)

makedepends=(git sed)
depends=(nodejs redis postgresql)
optdepends=(
  "ffmpeg: for video transcoding"
  "sonic: efficient full text search backend"
  "meilisearch: feature-rich full text search backend"
)


conflicts=(iceshrimp)
provides=(iceshrimp)

backup=("etc/iceshrimp/configuration.yml")

install="iceshrimp.install"

source=(
  "iceshrimp"::"git+https://iceshrimp.dev/iceshrimp/iceshrimp.git"
  "iceshrimp.service"
  "iceshrimp.sysusers"
  "iceshrimp.tmpfiles"
  "iceshrimp.install"
  "0001-yarnrc.patch"
)

sha512sums=('SKIP'
            'acca072ecf35da5a64fa8ecd1f7837af176351a7efc7c364035069ed16714de86fbe045cfe972d4c984f36bc5b1875f6e6cf208c3a10ac08712c976b61f80675'
            '9adf1781842ae7ff2779ca561f06ab2b6fb93e206698084283986627aba69b0fd4482ccbed3daebb2517e5966c326604e1cc57618589f331a966fee2db63815d'
            '9451d44ff2bec45df3074dbdda51cd2d898a3c510468e75373d81ed5a8ea975197eb40487d2bdb60038220d0a3e11551827a52847c47c06fe014b9df9f57426d'
            '36980c4f5a6d25d4f522ccd64aaf38c3d704c29a25b834b14135e2895f55318496fbaf269e589e4eabbf5495265682d6f58b966ce8b70f52190dccf7a18f44cc'
            '22fa645f8a20fcf076b5facef2e47bff5137dbdf9bb8b7c16ae0430645726161e701f09c4b76321498d38df46a9dd12a07f9706c603aa6f2324a97b79dcdab73')

pkgver() {
  cd "${srcdir}/iceshrimp"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/iceshrimp"

  # Remove packages for architectures other than current
  git apply "${srcdir}/0001-yarnrc.patch"
}

build() {
  cd "${srcdir}/iceshrimp"

  # Fix node-re2 build
  export CXXFLAGS="${CXXFLAGS/-fno-plt/}"
  export CXXFLAGS="${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"

  export NODE_ENV="production"

  corepack yarn install
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
  install -Dm 640 "${srcdir}/iceshrimp/.config/example.yml" "${pkgdir}/etc/iceshrimp/configuration.yml"

  find "${srcdir}/iceshrimp/.yarn/unplugged" -path "*/re2/build/Makefile" -or -path "*/re2/build/config.gypi" | xargs sed -i "s%${srcdir}%/usr/share%g"

  cp -dpTr --no-preserve=ownership "${srcdir}/iceshrimp/" "${pkgdir}/usr/share/iceshrimp"
  ln -s "/etc/iceshrimp/configuration.yml" "${pkgdir}/usr/share/iceshrimp/.config/default.yml"
  ln -s "/var/lib/iceshrimp/files" "${pkgdir}/usr/share/iceshrimp/files"
}
