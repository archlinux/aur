# Maintainer : Angel_Caido <geussepe at gmail dot com>
# Contributor : Sam Stuewe <halosghost at archlinux dot info>

_name=epoptes
pkgname="${_name}-bzr"
pkgver=0.5.7.426
pkgrel=1
pkgdesc='An opensource computer lab management and monitoring tool'
makedepends=('bzr' 'python2-distutils-extra')
url='https://code.launchpad.net/~epoptes/epoptes/trunk'
license=('GPL3')
depends=('python2-dbus' 'python2-notify' 'python2-pycha-hg' 'hicolor-icon-theme' 'python2-netifaces' 'python2-pyopenssl' 'python2-service-identity' 'python2-twisted' 'socat')
arch=('any')
conflicts=("${_name}")
provides=("${_name}")
source=('bzr+lp:epoptes'
  'epoptes-server.service'
  'epoptes-client.service'
  'epoptes-client')
sha256sums=('SKIP'
	    '0dd8cc5255798a73f8b88ad8f34a4b7c7340f88dbab65d05d2a74843843c9403'
	    'a7961919235f31a4a2059dda46bf1d0b3b5d20d06d1ce723804634de2443c20f'
	    '64d27face12b754dd01e6b46b511aca11fa348779471d9b9c025cbaf5176aa4d')

install="${_name}".install

pkgver () {
    cd "${srcdir}/${_name}"
    printf '%s.%s' "$(bzr tags --sort=time | tail -n1 | cut -d '-' -f1)" "$(bzr revno)"
}

prepare () {
    cd "${srcdir}/${_name}"
    sed -e 's/sbin/bin/g' \
        -i setup.py
    for i in 'epoptes/ui/benchmark.py' \
      'epoptes/ui/notifications.py' \
      'epoptes/daemon/uiconnection.py' \
      'epoptes/daemon/bashplex.py' \
      'epoptes/daemon/commands.py' \
      'epoptes-client/message' \
      'epoptes/core/wol.py' \
      'epoptes-client/lock-screen' \
      'epoptes/core/structs.py' \
      'epoptes/ui/about_dialog.py' \
      'epoptes/ui/execcommand.py' \
      'epoptes/common/config.py' \
      'epoptes/ui/remote_assistance.py' \
      'epoptes/ui/gui.py' \
      'epoptes/common/xdg_dirs.py' \
      'twisted/plugins/epoptesd.py' \
      'epoptes/common/ltsconf.py' \
      'epoptes/ui/sendmessage.py' \
      'epoptes-client/remote-assistance' \
      'epoptes-client/screenshot' \
      'epoptes/common/constants.py' \
      'epoptes/daemon/guiplex.py' \
      'epoptes/daemon/exchange.py' \
      'epoptes/core/lib_users.py' \
      'epoptes/ui/client_information.py'
    do 
      sed -i '1s+python+python2+' $i
    done
}

package () {
    cd "${srcdir}/${_name}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
    mkdir "${pkgdir}/usr/lib/systemd"
    mkdir "${pkgdir}/usr/lib/systemd/system"
    mkdir "${pkgdir}/etc/default"
    install -m 644 "${startdir}/epoptes-client.service" "${pkgdir}"/usr/lib/systemd/system/epoptes-client.service
    install -m 644 "${startdir}/epoptes-server.service" "${pkgdir}"/usr/lib/systemd/system/epoptes-server.service
    install -m 644 "${startdir}/epoptes-client" "${pkgdir}"/etc/default/epoptes-client
}
