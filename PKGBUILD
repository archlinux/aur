# Maintainer: Junxuan Liao <mikeljx at 126 dot com>

_pkgname=chatbot-ui
pkgname=$_pkgname-legacy-git
pkgver=r238.6bdbf1c
pkgrel=1
pkgdesc="An open source ChatGPT UI. (legacy version)"
arch=('x86_64')
url='https://github.com/mckaywrigley/chatbot-ui'
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
backup=("etc/webapps/${pkgname}/.env.local")
source=("git+$url.git#branch=legacy"
        "sysusers.conf"
        "chatbot-ui-legacy.service"
        "0001-support-GPT-4-Turbo.patch")
options=(!emptydirs)
sha256sums=('SKIP'
            '58ecd3fccc798f90d906d9a9928ee1268e916f277dfd35e644ca0ce83fde5c30'
            'bad9ec7fd322307418ee821b070c45c3f7151cc4ca5ca7a50f29c7892f2e1ed4'
            '6cb74c1c48ee5bbd63f1bec185d83572237e9a3375e33a073cc76c50c443e290')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}"
  git apply "${srcdir}"/"0001-support-GPT-4-Turbo.patch" 
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

  # Configure chatbot-ui-legacy user and some directories writable for that user.
  install -Dm0644 ${srcdir}/sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

  # Install systemd service file.
  install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}"/chatbot-ui-legacy.service

  # Install MIT license.
  install -Dm0644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
