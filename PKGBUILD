# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: ahrs <Forward dot to at hotmail dot co dot uk>

_pkgname=homebridge
pkgname=$_pkgname-git
pkgver=0.4.46.r222.g721ff2c
pkgrel=3
pkgdesc="HomeKit support for the impatient"
arch=('any')
url="https://github.com/nfarina/homebridge"
license=('apache')
depends=('nodejs>=10.17.0' 'avahi')
makedepends=(
  'git'
  'npm'
  'python' # Needed for node-gyp for building native modules
)
provides=('homebridge')
conflicts=('homebridge')
options=(!emptydirs)
source=(
  "git+${url}.git"
  "${_pkgname}-system.service"
  "${_pkgname}-user.service"
  "${_pkgname}.sysusers"
  "${_pkgname}.install"
)
sha512sums=('SKIP'
            '16f923855946b1ff7fd6b70da035a304634c7dd42bd2e86c5877718fd5e3a22a7177fd8d850e7ffa4826cdd2fc2b30f727bd182809ddb9faade626f87ed792bc'
            '2fc28db38b231caf8021bd6109e1c4cee65dd68e2128e9f2bfe712fd61867328dd6b6be642a6431b2c92657a5e7f23991be8dcf1ea0c23e3cfa120341ee090bc'
            '18277a981c2e6f68ed6433d9afc89fb59019b763c253dd135bb3662baba2185245a7eb476b3eed36f5458386447ed766b89dd0e307c5c1ab277900a01c625c7d'
            '20e373e99d814ea23b5fa0c966cafdc7e8bf116443c475d08870bffc36027ae512fa2e0c6996802f04e9703a9df52bacf2e25ecadb04b137c798524e50e6817d')

install="${_pkgname}.install"

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"

  # Fix error with npm5 issue
  tar -czf homebridge.tgz homebridge
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_pkgname.tgz
  
  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  # Delete npm installed pyc files
  find "$pkgdir" -name "*.pyc" -delete

  [ -z "$HOMEBRIDGE_KEEP_GIT_HISTORY" ] && rm -rf "${pkgdir}/usr/lib/node_modules/${_pkgname}/.git"

  install -Dm644 "${srcdir}/${_pkgname}-system.service" "$pkgdir/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "${srcdir}/${_pkgname}-user.service" "$pkgdir/usr/lib/systemd/user/${_pkgname}.service"
  install -Dm644 "${srcdir}/${_pkgname}.sysusers" "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"

}

# vim:set ts=2 sw=2 et:
