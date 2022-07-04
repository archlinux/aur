pkgname=sysrq-enabler
pkgver=2
pkgrel=1
pkgdesc="Enable all magicsysrq options by default"
arch=(any)
url=file:///usr/lib/sysctl.d/99-sysrq.conf
License=('GPL')

cat <<'EOF' > install
post_install() {
	sysctl -w kernel.sysrq=1
	}

post_upgrade() {
	sysctl -w kernel.sysrq=1
	oldconf='/etc/sysctl.d/99-sysrq.conf'
	if [ -f "$oldconf" ] ; then
	    rm -f "$oldconf"
	fi
	}

post_remove() {
	sysctl -w kernel.sysrq=0
	conf='/usr/lib/sysctl.d/99-sysrq.conf'
	if [ -f "$conf" ] ; then
	    rm -f "$conf"
	fi
	}
EOF

package() {
mkdir -pm 755 ${pkgdir}/usr/lib/sysctl.d
echo 'kernel.sysrq=1' > ${pkgdir}/usr/lib/sysctl.d/99-sysrq.conf
chmod 644 ${pkgdir}/usr/lib/sysctl.d/99-sysrq.conf
}
