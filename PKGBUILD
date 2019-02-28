# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgbase='ovirt-guest-agent'
pkgname=("${pkgbase}")
pkgver="1.0.16"
pkgrel='1'
pkgdesc='The oVirt Guest Agent'
arch=('x86_64')
url="https://ovirt.org/develop/developer-guide/vdsm/guest-agent"
makedepends=('python2-pycodestyle' 'autoconf')
depends=('qemu-guest-agent' 'python2-dbus' 'python2-gobject2' 'dbus-glib' 'python2-ethtool' 'usermode')
pkgdesc='The oVirt Guest Agent'
license=('ASL 2.0')
install="${pkgbase}.install"
source=("https://github.com/oVirt/${pkgbase}/archive/${pkgver}.tar.gz"
	"39-ovirt-memory-hotplug.rules"
	"console.apps_diskmapper"
	"pam.d_diskmapper"
	"${pkgbase}.tmpfiles"
	"${pkgbase}.sysusers"
	"${pkgbase}.service")
sha256sums=('299ff836c7dd3515d16e41c0af0d26c5791dedbe3279a7046ac43822a9ffaa36'
            '78994d3cfe8f293aab84692c9d181b2c20caeb47e9854bb9377f2199b45984fb'
            '3575b027e6364d5b0d664cff9f9bc6c27a6a57691f7f188c3cf281663ccc3c0d'
            'f9afb37eb23e77cf59d34f8783d3cacc509ed9400936c3dc95d6db629b3b58a1'
            '7c4ef4e3a9a31e243c8d95991e8e0cea2eed92a3a6066fef1642ef9e1fb8b2fa'
            'fab3d62ecd8f6546d5b193f4ca22919de20451678b4cce2c53aa0977fed4f483'
            '45864cbe0576d33962ee57bf4ac0c5f70e67c423278bf291e8ecefe2668ff538')
backup=("etc/${pkgbase}.conf")

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  autoreconf -fvi
  PYTHON=/usr/bin/python2 ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib \
    --datarootdir=/usr/share \
    --datadir=/usr/share \
    --infodir=/usr/share/info \
    --includedir=/usr/include/security \
    --enable-securedir=/usr/lib/security \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-pam-prefix=/etc \
    --without-gdm \
    --without-kdm
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm0644 "${srcdir}/${pkgbase}.service" "${pkgdir}/usr/lib/systemd/system/${pkgbase}.service"
  install -Dm0644 "${srcdir}/${pkgbase}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgbase}.conf"
  install -Dm0644 "${srcdir}/${pkgbase}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgbase}.conf"
  install -Dm0644 "${srcdir}/39-ovirt-memory-hotplug.rules" "${pkgdir}/usr/lib/udev/rules.d/39-ovirt-memory-hotplug.rules"
  mv "${pkgdir}/etc/udev/rules.d/"* "${pkgdir}/usr/lib/udev/rules.d/"
  rm -rf "${pkgdir}/etc/udev"

# EL7 Magic
  cp "${srcdir}/console.apps_diskmapper" "${pkgdir}/etc/security/console.apps/diskmapper"
  cp "${srcdir}/pam.d_diskmapper" "${pkgdir}/etc/pam.d/diskmapper"
  mv "${pkgdir}/usr/share/${pkgbase}/diskmapper" "${pkgdir}/usr/share/${pkgbase}/diskmapper.script"
  ln -s "/usr/bin/consolehelper" "${pkgdir}/usr/share/${pkgbase}/diskmapper"
}
