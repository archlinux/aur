# Maintainer: Pierre Mavro <pmavro at qovery dot com>

# Check for new Linux releases in: https://app.vanta.com/employee/onboarding

_binname=vanta
_svcname=vanta-agent

pkgname=vanta-agent
pkgver=2.0.3
pkgrel=4
pkgdesc="Vanta agent"
arch=('x86_64')
url="https://www.vanta.com/"
depends=('systemd')
license=('custom:vanta')
install=$pkgname.install
source=("https://vanta-agent-repo.s3.amazonaws.com/targets/versions/${pkgver}/${_binname}-amd64.deb")

package() {
	echo "  -> Extracting the data.tar.gz..."
	tar -xzf data.tar.gz -C .

	echo "  -> Moving stuff in place..."
	# systemd
	install -Dm644 "$srcdir"/usr/lib/systemd/system/vanta.service "$pkgdir"/usr/lib/systemd/system/$_svcname.service
    # changelog
	install -Dm644 usr/share/doc/vanta/changelog.gz "$pkgdir"/usr/share/doc/$_binname/changelog.gz
    # vanta
    for i in var/vanta/* ; do
        install -Dm755 $i "$pkgdir"/$i
    done

    # config
    if [ ! -f /etc/$_binname.conf ] ; then
        echo -e "\nEnter Vanta owner email:"
        read email
        echo -e "\nEnter Vanta key:"
        read key

        sed -i "s/\"OWNER_EMAIL\": \"\"/\"OWNER_EMAIL\": \"$email\"/g" $srcdir/etc/$_binname.conf
        sed -i "s/\"AGENT_KEY\": \"\"/\"AGENT_KEY\": \"$key\"/g" $srcdir/etc/$_binname.conf
        chmod 640 $srcdir/etc/$_binname.conf
        cp $srcdir/etc/$_binname.conf /tmp/$_binname.conf

        # instructions
        echo -e "\n\nWhen it's installed, you have to perform those actions to make it work:"
        echo "1. Enable and start service: sudo systemctl enable $_svcname.service && sudo systemctl start $_svcname.service"
        echo "2. Check everything is running as expected: /var/vanta/vanta-cli status"
        echo "3. Perform a clean: sudo /var/vanta/vanta-cli reset"
        echo "4. Check your setup: sudo /var/vanta/vanta-cli doctor"

        echo -e "More info: https://help.vanta.com/hc/en-us/articles/360060472372-Troubleshooting-the-Vanta-Agent-on-Linux-Machines\n\n"
    fi
}
sha256sums=('2d25af250f3ef1656283cf42fcc6c737a052adfeda765d266b034d21226e3842')
