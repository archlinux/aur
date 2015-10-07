# Maintainer : Angel_Caido <geussepe at gmail dot com>
# Contributor : Sam Stuewe <halosghost at archlinux dot info>

pkgname=(epoptes-bzr epoptes-client-bzr)
pkgbase=epoptes-bzr
pkgver=0.5.8.442
pkgrel=1
pkgdesc='An opensource computer lab management and monitoring tool'
makedepends=(bzr python2-distutils-extra)
url='https://code.launchpad.net/~epoptes/epoptes/trunk'
license=(GPL3)
arch=(any)
conflicts=(epoptes)
provides=(epoptes)
source=('bzr+lp:epoptes'
        'epoptes.service'
        'epoptes-client.service')
sha256sums=('SKIP'
            'ea47542b6c6e7a1f75a715927f3b7e13ea4ffd47ded7874c61c153e107c3313e'
	    '97d2ea075e17c83be61dc05be4c410c087ab930c7dd4840a50e9459a8d46f97c')

install=epoptes.install

pkgver () {
    cd "${srcdir}/epoptes"
    printf '%s.%s' "$(bzr tags --sort=time | awk '{print $1}' | cut -d'-' -f1 | tail -n1)" "$(bzr revno)"
}

prepare () {
    cd "${srcdir}/epoptes"
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

package_epoptes-bzr () {
    depends=(libfaketime
	     librsvg
	     notification-daemon
	     xfce4-notifyd
	     openssl
	     python
	     python2-pyopenssl
	     openssl
             pygtk
             python2-dbus
             python2-notify
             python2-pycha-hg
             hicolor-icon-theme
             python2-netifaces
             python2-pyopenssl
             python2-service-identity
             python2-twisted
             socat
             x11vnc
             ssvnc
             iperf
             xterm)

    cd "${srcdir}/epoptes"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
    mkdir -p "${pkgdir}/etc/default"
    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    install -m 644 "${startdir}/epoptes.service" "${pkgdir}"/usr/lib/systemd/system/epoptes.service
    install -m 644 "${startdir}/src/epoptes/debian/epoptes.default" "${pkgdir}"/etc/default/epoptes
    rm "${pkgdir}/usr/bin/epoptes-client"
    rm -r "${pkgdir}/etc/xdg"
    rm -r "${pkgdir}/usr/share/epoptes-client"
    rm -r "${pkgdir}/usr/share/ldm"
    rm -r "${pkgdir}/usr/share/man/man8"
    cp -dr --no-preserve=ownership "${startdir}/src/epoptes/epoptes" "${pkgdir}"/usr/share/pyshared
    cp -dr --no-preserve=ownership "${startdir}/src/epoptes/twisted" "${pkgdir}"/usr/share/pyshared

}

package_epoptes-client-bzr () {
    pkgdesc="An opensource computer lab management and monitoring tool - client side"
    depends=(iproute2
             procps-ng
	     python
             librsvg
	     lib32-procps-ng
             bsdmainutils
             screen
             iperf
             pygtk
             socat
             x11vnc
             ssvnc
             openssl
             xterm
	     ethtool)

    conflicts=(epoptes-client) 
    provides=(epoptes-client) 
    install=epoptes-client.install

    cd "${srcdir}/epoptes"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    mkdir -p "${pkgdir}/etc/default"
    install -m 644 "${startdir}/src/epoptes/debian/epoptes-client.default" "${pkgdir}"/etc/default/epoptes
    install -m 644 "${startdir}/epoptes-client.service" "${pkgdir}/usr/lib/systemd/system/epoptes-client.service"
    rm "${pkgdir}/usr/bin/epoptes"
    rm -r "${pkgdir}/usr/share/epoptes"
    rm -r "${pkgdir}/usr/lib/python2.7"
    rm -r "${pkgdir}/usr/share/applications"
    rm -r "${pkgdir}/usr/share/doc"
    rm -r "${pkgdir}/usr/share/icons"
    rm -r "${pkgdir}/usr/share/locale"
    rm -r "${pkgdir}/usr/share/ltsp"
    rm -r "${pkgdir}/usr/share/man/man1"
    mv "${pkgdir}/etc/default/epoptes" "${pkgdir}/etc/default/epoptes-client"
}
