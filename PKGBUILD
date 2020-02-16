# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgbase=mad-metasploit-git
pkgname=(mad-metasploit-git mad-metasploit-archive-git)
_pkgname=mad-metasploit
pkgver=r178.0ebe2c0
pkgrel=1
pkgdesc="A Collection of Metasploit Plugins, Modules and Scripts"
arch=('any')
url="https://www.hahwul.com/p/mad-metasploit.html"
license=('MIT')
depends=('ruby' 'metasploit')
makedepends=('git')
optdepends=(
#  "arachni-scanner: arachni web scanner plugin" # This used to have a seriously broken PKGBUILD
  "exploitdb: db_exploit plugin"
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/hahwul/mad-metasploit.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
# Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  #patch -p1 -i "$srcdir/${pkgname%-VCS}.patch"
  cat > config/config.rb << EOF
\$metasploit_path = "${pkgdir}/opt/metasploit"
EOF

}

package_mad-metasploit-git() {
  cd "${srcdir}/${_pkgname}"
  install -dm755 "${pkgdir}/opt/metasploit/modules/exploits"
  install -dm755 "${pkgdir}/opt/metasploit/modules/post"
  install -dm755 "${pkgdir}/opt/metasploit/modules/auxiliary"
  install -dm755 "${pkgdir}/opt/metasploit/plugins"
  install -dm755 "${pkgdir}/opt/metasploit/scripts"
  ./mad-metasploit
  echo " - Copying scripts"
  cp mad-metasploit-resource-script/* "${pkgdir}/opt/metasploit/scripts"
  install -Dm644 awesome.md "${pkgdir}/opt/metasploit/awesome.md"
}

package_mad-metasploit-archive-git() {
  provides=("mad-metasploit-archive")
  conflicts=("mad-metasploit-archive")
  unset optdepend
  cd "${srcdir}/${_pkgname}/archive"
  install -dm755 "${pkgdir}/opt/metasploit/modules/exploits/mad-metasploit-archive"
  cp -r exploits "${pkgdir}/opt/metasploit/modules/exploits/mad-metasploit-archive"
}
