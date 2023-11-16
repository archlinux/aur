# Maintainer: zotan <aur@zotan.email>

pkgname=iceshrimp-git
pkgver=v2023.11.1.r38.g1b1040647
pkgrel=1
pkgdesc="YAMF (Yet another Misskey fork) bringing you no-nonsense fixes, features & improvements you actually want since 2023"
arch=(x86_64 aarch64)
url="https://iceshrimp.dev/iceshrimp/iceshrimp"
license=(AGPL3)

makedepends=(makepkg-git-lfs-proto npm)
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
  "iceshrimp::git-lfs+https://iceshrimp.dev/iceshrimp/iceshrimp.git#branch=dev"
  "iceshrimp.service"
  "iceshrimp.sysusers"
  "iceshrimp.tmpfiles"
  "iceshrimp.install"
  "0001-yarnrc.patch"
)

sha512sums=('SKIP'
            'd35b085754e8a03447f8d17fae1649b432709d2d5fe9149ec95e3d5b3857efd6d65021efb483ed91711f5a73ad2a02d12e4d885a660418fa0cd16541aa830153'
            '9adf1781842ae7ff2779ca561f06ab2b6fb93e206698084283986627aba69b0fd4482ccbed3daebb2517e5966c326604e1cc57618589f331a966fee2db63815d'
            '9451d44ff2bec45df3074dbdda51cd2d898a3c510468e75373d81ed5a8ea975197eb40487d2bdb60038220d0a3e11551827a52847c47c06fe014b9df9f57426d'
            '97308f8e926c2204be2b521023a2c2e4cb7767e44440998c8f3a6feb97f0d9dd08798bc019bfb1b6ac0366305c8ec57ae8a3ec10aeaa297df56f6a1615fa56ff'
            '4b9a26028bba186fa5a9fd977dbe416a6f8351f2fd04902e0f4ccf1ffb44b9ea0fa957345c5f98f9cc58453cd40ab1f95253e416564f40310868a8c654178ae7')

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

  find "${srcdir}/iceshrimp/.yarn/unplugged" -path "*/re2/build/Makefile" -or -path "*/re2/build/config.gypi" | xargs -r sed -i "s%${srcdir}%/usr/share%g"

  cp -dpTr --no-preserve=ownership "${srcdir}/iceshrimp/" "${pkgdir}/usr/share/iceshrimp"
  ln -s "/etc/iceshrimp/configuration.yml" "${pkgdir}/usr/share/iceshrimp/.config/default.yml"
  ln -s "/var/lib/iceshrimp/files" "${pkgdir}/usr/share/iceshrimp/files"

  rm -rf "${pkgdir}/usr/share/iceshrimp/.git"
  rm -rf "${pkgdir}/usr/share/iceshrimp/packages"/{backend,client}/"src"
}
