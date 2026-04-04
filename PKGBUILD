# Maintainer: Mark Collins <tera_1225 [aaht] hotmail ðot com>

_name='mesh-mini'
pkgname="${_name}-git"
pkgver=r35.f06ec22
pkgrel=1
pkgdesc='Simple graphical tool to crop the pages of PDF files'
arch=('any')
url='https://github.com/brytonsalisbury/mesh-mini'
license=('Apache-2.0')
depends=(
  'nodejs'
)
makedepends=(
  'git'
  'npm'
)
provides=("${_name}")
conflicts=("${_name}")
source=(
    "git+${url}.git"
    "mesh-mini-server.service"
)
sha256sums=('SKIP'
            '24b79865a62a955951fded595d513a30090aa7cb37389ca0c3b716e0de4d3b6a')

pkgver() {
  # There are tags, but the last one dates back to 2023 so ignore them
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$_name"
    npm install --cache "${srcdir}/npm-cache" 
}

package() {
    cd "$_name"
    _inst_dir="${pkgdir}/usr/lib/node_modules/${_name}/"
    mkdir -p "$_inst_dir"
    install "api.js" "$_inst_dir"
    install "common.js" "$_inst_dir"
    install "interceptor.js" "$_inst_dir"
    install "meshcommander.js" "$_inst_dir"
    install "package-lock.json" "$_inst_dir"
    install "package.json" "$_inst_dir"
    install "readme.md" "$_inst_dir"
    install "webserver.js" "$_inst_dir"
    cp -r "config" "$_inst_dir"
    cp -r "node_modules" "$_inst_dir"
    cp -r "public" "$_inst_dir"
    install -D "${srcdir}/mesh-mini-server.service" "${pkgdir}/usr/lib/systemd/system/mesh-mini-server.service"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    find "${pkgdir}" -type f -exec chmod 644 {} \;
}
