# Maintainer: milouse <etienne at depar dot is>
# Maintainer: peshane <social at peshane dot net>
pkgname=luniistore
pkgver=2.2.271
pkgrel=2
pkgdesc="Manage your Lunii's My Fabulous Storyteller content or buy new ones"
arch=('x86_64')
url="https://www.lunii.fr"
license=('unknown')
depends=('java-runtime>=8')
groups=('')
options=('!strip' '!emptydirs')
source_x86_64=("https://storage.googleapis.com/storage.lunii.fr/public/deploy/installers/linux/64bits/luniistore-${pkgver}-64bits.deb")
sha512sums_x86_64=('1278d3a2d490ea98b8cf1caa4938a9d193575d9a36eb8b7b6601997fa8f4960c4d4666cc4ee9c77a62d7ab9f4fb8c7dfefbe2fa3d390afe0b612db465d8f23e6')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
    # Remove weird group authorization to write on /opt
    chmod -R g-w "${pkgdir}/opt"

    install -D -m644 "${pkgdir}/opt/Luniistore/runtime/THIRDPARTYLICENSEREADME.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${pkgdir}/opt/Luniistore/runtime/COPYRIGHT" \
            "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

    install -D -m644 "${pkgdir}/opt/Luniistore/Luniistore.desktop" \
            "${pkgdir}/usr/share/applications/luniistore.desktop"

    install -d -m755 "${pkgdir}/etc/udev/rules.d"
    echo "SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"0c45\", ATTRS{idProduct}==\"6820\", MODE=\"0666\"" > "${pkgdir}/etc/udev/rules.d/99-lunii.rules"

    install -d -m755 "${pkgdir}/usr/share/libalpm/hooks"
    cat > "${pkgdir}/usr/share/libalpm/hooks/reload-lunii-udev-rule.hook" <<END
[Trigger]
Type = Path
Operation = Install
Operation = Upgrade
Operation = Remove
Target = etc/udev/rules.d/99-lunii.rules

[Action]
Description = Reloading Lunii udev rules...
When = PostTransaction
Exec = /usr/bin/udevadm control --reload-rules
END
    chmod 0644 "${pkgdir}/usr/share/libalpm/hooks/reload-lunii-udev-rule.hook"
}
