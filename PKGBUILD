# Maintainer: 苏向夜 <fu050409@163.com>
# SPDX-FileCopyrightText: 2026 Fomalhaut contributors
# SPDX-License-Identifier: 0BSD

pkgname=fomalhaut-theme-nocturne
_upstream_name=fomalhaut
_upstream_ver=0.0.3
_source_ref=71c0a28a60690550a4904a419962a150734e0090
pkgver=0.0.3
pkgrel=1
pkgdesc='Official Nocturne theme for Fomalhaut'
arch=('any')
url='https://github.com/noctisynth/fomalhaut'
license=('AGPL-3.0-only')
optdepends=(
  'greetd-fomalhaut: use Nocturne as the greeter theme'
  'fomalhaut-lock: use Nocturne as the locker theme'
)
makedepends=('npm')
source=("${_upstream_name}-${_source_ref}.tar.gz::${url}/archive/${_source_ref}.tar.gz")
sha256sums=('8e732f4d1b9490ea3104506c4197f763036896c76b5daf2258436d64d234baac')

_source_dir="${_upstream_name}-${_source_ref}"

prepare() {
  cd "${_source_dir}"
  cp packaging/aur/fomalhaut-theme-nocturne/package.json package.json
  cp packaging/aur/fomalhaut-theme-nocturne/package-lock.json package-lock.json
  npm ci --ignore-scripts --legacy-peer-deps
  ln -s ../packages/fomalhaut-sdk node_modules/fomalhaut-sdk
}

build() {
  cd "${_source_dir}"
  node_modules/.bin/tsc --project packages/fomalhaut-sdk/tsconfig.json
  cd themes/nocturne
  ../../node_modules/.bin/tsc --build
  ../../node_modules/.bin/vite build --config vite-config.ts
  node scripts/verify-build.mjs
}

check() {
  cd "${_source_dir}"
  cd themes/nocturne
  ../../node_modules/.bin/biome check .
  ../../node_modules/.bin/tsc --build --pretty false
  node scripts/check-file-names.mjs
  ../../node_modules/.bin/vitest run --config vite-config.ts
}

package() {
  cd "${_source_dir}"

  install -d "${pkgdir}/usr/share/fomalhaut/themes/nocturne"
  cp -r themes/nocturne/dist/. \
    "${pkgdir}/usr/share/fomalhaut/themes/nocturne/"
  find "${pkgdir}/usr/share/fomalhaut/themes/nocturne" -type d -exec chmod 0755 {} +
  find "${pkgdir}/usr/share/fomalhaut/themes/nocturne" -type f -exec chmod 0644 {} +
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
