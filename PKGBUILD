# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname="python-certipy-ad-git"
pkgver=5.1.0.r12.g3ae3442
pkgrel=1
pkgdesc="Tool for Active Directory Certificate Services enumeration and abuse"
arch=('any')
provides=(
  "${pkgname%-git}=$pkgver"
  "certipy-ad=$pkgver"
)
conflicts=(
  "${pkgname%-git}"
  'certipy-ad'
)
url="https://github.com/ly4k/certipy"
license=('MIT')
depends=(
  'python>=3.12'
  'python-asn1crypto>=1.5.1'
  'python-cryptography>=42.0.8'
  'impacket>=0.13.0'
  'python-ldap3>=2.9.1'
  'python-pyasn1>=0.6.1'
  'python-dnspython>=2.7.0'
  'python-requests>=2.32.3'
  'python-pycryptodome>=3.22.0'
  'python-beautifulsoup4>=4.13.4'
  'python-httpx>=0.28.1'
  'python-argcomplete>=3.6.2'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools>=69.0'
  'git'
)
optdepends=(
  'python-neo4j: For BloodHound output'
)
source=("git+$url")
b2sums=('SKIP')

prepare() {
  git -C certipy clean -dfx
}

pkgver() {
  cd certipy
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd certipy
  python -m build -wnx
}

package() {
  cd certipy
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm0644 <(register-python-argcomplete -s bash certipy) "$pkgdir/usr/share/bash-completion/completions/certipy"
  install -Dm0644 <(register-python-argcomplete -s zsh certipy) "$pkgdir/usr/share/zsh/site-functions/_certipy"
  install -Dm0644 <(register-python-argcomplete -s fish certipy) "$pkgdir/usr/share/fish/vendor_completions.d/certipy.fish"
}

# vim: ts=2 sw=2 et:
