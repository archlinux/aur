# Maintainer: Junxuan Liao <mikeljx at 126 dot com>

_pkgname=chatbot-ui
pkgname=$_pkgname-git
pkgver=r293.2e6c0ee
pkgrel=5
pkgdesc="An open source ChatGPT UI."
arch=('x86_64')
url='https://github.com/mckaywrigley/chatbot-ui'
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
backup=("etc/webapps/${pkgname}/.env.local")
source=("git+$url.git"
        "sysusers.conf"
        "chatbot-ui.service"
        "0001-support-GPT-4-Turbo.patch"
        "0002-Fix-json-parsing.patch")
options=(!emptydirs)
sha256sums=('SKIP'
            '4de4e4d3bac91214398da078b3f2b5d72182b7e6a69c9124eb19713827942958'
            '45dcb629ff221cd36d0f4c22cd5d886924233ada9b342bb0e59546fb35d1bea6'
            '5824fc36a6a100151e6a27e8d1b0389a16517a4f2151e14e3f55ce5cd450ffec'
            'bf4cccd454d1d77038d71627fb00ec49428e014bd90ed565512910b463aff952')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}"
  git apply "${srcdir}"/"0001-support-GPT-4-Turbo.patch" 
  git apply "${srcdir}"/"0002-Fix-json-parsing.patch" 
}

build() {
  cd "${_pkgname}"
  npm install
  npm run build
}

package() {
  cd "${_pkgname}"

  install -m0755 -d "${pkgdir}/usr/share/webapps/${pkgname}"

  # install application parts
  cp -a node_modules .next public next.config.js next-i18next.config.js "${pkgdir}/usr/share/webapps/${pkgname}"  
  install -m0644 package*.json -t "${pkgdir}/usr/share/webapps/${pkgname}"

  # Setup config files in /etc.
  install -m0755 -d "${pkgdir}/etc/webapps/${pkgname}"
  touch "${pkgdir}/etc/webapps/${pkgname}/.env.local"

  ln -s "/etc/webapps/${pkgname}/.env.local" "${pkgdir}/usr/share/webapps/${pkgname}/.env.local"

  # Configure chatbot-ui user and some directories writable for that user.
  install -Dm0644 ${srcdir}/sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

  # Install systemd service file.
  install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}"/chatbot-ui.service

  # Install MIT license.
  install -Dm0644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
