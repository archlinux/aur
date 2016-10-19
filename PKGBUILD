# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=opentimestamps-client-git
pkgver=0.3.1.r10.g10677dfe
pkgrel=1
pkgdesc="Command-line tool to create and validate timestamp proofs with the OpenTimestamps protocol"
arch=(any)
url="https://github.com/opentimestamps/opentimestamps-client"
license=('LGPL3')
depends=('python-opentimestamps-git')
optdepends=('python-pysocks: for socks5 support')
source=(git+https://github.com/opentimestamps/opentimestamps-client)
md5sums=('SKIP')
_python_site=$(python -c 'import site; print(site.getsitepackages()[0]);')

pkgver() {
  cd ${pkgbase%-git}
  git describe --long --tags | sed 's/^opentimestamps-client-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${pkgbase%-git}
  install -dm755 "${pkgdir}/${_python_site}" "${pkgdir}/usr/share/$pkgname"
  cp -a otsclient "${pkgdir}/${_python_site}"
  python -m compileall "${pkgdir}/${_python_site}/otsclient"
  python -O -m compileall "${pkgdir}/${_python_site}/otsclient"

  install -Dm755 ots "$pkgdir/usr/bin/ots"
  install -Dm755 ots-git-gpg-wrapper "$pkgdir/usr/share/$pkgname/ots-git-gpg-wrapper"
  printf '%s\n' "#!/bin/sh" "/usr/share/$pkgname/ots-git-gpg-wrapper --gpg-program /usr/bin/gpg \`git config gpg.ots-args\` -- \"\$@\"" > "$pkgdir/usr/bin/ots-git-gpg-wrapper.sh"
  chmod 755 "$pkgdir/usr/bin/ots-git-gpg-wrapper.sh"
}
