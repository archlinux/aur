# Maintainer: zotan <aur@zotan.email>

pkgname=iceshrimp-pre
pkgver=v2023.11.3
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
  "iceshrimp::git-lfs+https://iceshrimp.dev/iceshrimp/iceshrimp.git#tag=${pkgver}"
  "iceshrimp.service"
  "iceshrimp.sysusers"
  "iceshrimp.tmpfiles"
  "iceshrimp.install"
  "iceshrimp.hook"
  "0001-yarnrc.patch"
)

sha512sums=('SKIP'
            'd35b085754e8a03447f8d17fae1649b432709d2d5fe9149ec95e3d5b3857efd6d65021efb483ed91711f5a73ad2a02d12e4d885a660418fa0cd16541aa830153'
            '9adf1781842ae7ff2779ca561f06ab2b6fb93e206698084283986627aba69b0fd4482ccbed3daebb2517e5966c326604e1cc57618589f331a966fee2db63815d'
            '2c148ad7606b0ffc40526d682e2b419de46e4b3d6258240e5664774e41c872747daa7aaa39a58b63c590dba0fb2259cbed06746bffb6da78d25eb8b23f32e512'
            '36980c4f5a6d25d4f522ccd64aaf38c3d704c29a25b834b14135e2895f55318496fbaf269e589e4eabbf5495265682d6f58b966ce8b70f52190dccf7a18f44cc'
            '130d1b1aae460ddb082d945b525fb046dcaa9084622b6daebff3f1cd9c8d4cc7dc7b68959a5487cfc0df91641c5423dccc723152726980b7230c2134f7bf2a6a'
            '4b9a26028bba186fa5a9fd977dbe416a6f8351f2fd04902e0f4ccf1ffb44b9ea0fa957345c5f98f9cc58453cd40ab1f95253e416564f40310868a8c654178ae7')

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
  ln -s "/etc/iceshrimp/configuration.yml" "${pkgdir}/usr/share/iceshrimp/.config/default.yml"
  ln -s "/var/lib/iceshrimp/files" "${pkgdir}/usr/share/iceshrimp/files"
  ln -s "/var/lib/iceshrimp/.cache" "${pkgdir}/usr/share/iceshrimp/.cache"

  rm -rf "${pkgdir}/usr/share/iceshrimp/.git"
  rm -rf "${pkgdir}/usr/share/iceshrimp/packages"/{backend,client}/"src"
}
