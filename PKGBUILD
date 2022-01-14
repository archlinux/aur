# Maintainer: Pierre Mavro <pmavro at qovery dot com>

# Check for new Linux releases in: https://app.vanta.com/employee/onboarding

_binname=vanta
_svcname=vanta-agent

pkgname=vanta-agent
pkgver=2.0.3
pkgrel=1
pkgdesc="Vanta agent"
arch=('x86_64')
url="https://www.vanta.com/"
depends=('systemd')
license=('custom:vanta')
source=("https://vanta-agent-repo.s3.amazonaws.com/targets/versions/${pkgver}/${_binname}-amd64.deb")

package() {
	echo "  -> Extracting the data.tar.gz..."
	tar -xzf data.tar.gz -C .

	echo "  -> Moving stuff in place..."
	# systemd
	install -Dm644 "$srcdir/usr/lib/systemd/system/vanta.service" "$pkgdir/usr/lib/systemd/system/$_svcname.service"
    # changelog
	install -Dm644 usr/share/doc/vanta/changelog.gz "$pkgdir/usr/share/doc/$_binname/changelog.gz"
    # vanta
    for i in var/vanta/* ; do
        install -Dm755 $i "$pkgdir/$i"
    done
    # config
    if [ ! -f $pkgdir/etc/vanta.conf ] ; then
        install -Dm644 $srcdir/etc/vanta.conf "$pkgdir/etc/$_binname.conf"

        # last instructions
        echo -e "\n\nWhen it's installed, you have to perform those actions to make it work:"
        echo "1. Edit /etc/vanta.conf file with your email and secret"
        echo "2. Enable and start service: systemctl enable $_svcname.service && systemctl start $_svcname.service"
        echo "3. Check everything is running as expected: /var/vanta/vanta-cli status"
        echo "4. Register your secret key: sudo /var/vanta/vanta-cli register --secret <secret> --email <email>"
        echo "5. Check your setup: sudo /var/vanta/vanta-cli doctor"

        echo -e "\n\nIf you don't see your computer in the registred list, you can try: sudo /var/vanta/vanta-cli reset"
        echo -e "More info: https://help.vanta.com/hc/en-us/articles/360060472372-Troubleshooting-the-Vanta-Agent-on-Linux-Machines\n\n"
    fi
}
sha256sums=('2d25af250f3ef1656283cf42fcc6c737a052adfeda765d266b034d21226e3842')
