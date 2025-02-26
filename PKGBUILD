# Maintainer: milouse <etienne at depar dot is>
# Maintainer: peshane <social at peshane dot net>
pkgname=luniistore
pkgver=4.0.312
pkgrel=1
pkgdesc="Manage your Lunii's My Fabulous Storyteller content or buy new ones"
arch=('x86_64')
url="https://www.lunii.fr"
license=('unknown')
depends=('java-runtime>=8')
options=('!strip' '!emptydirs')
source_x86_64=("https://storage.googleapis.com/storage.lunii.fr/public/deploy/installers/linux/64bits/lunii-${pkgver}-amd64.deb")
sha512sums_x86_64=('a543e5f54b4df5f70d699bdd233d905fcfcfb07ab0393bcaf05b7cff159acafa80cab64061a8fd91e913d843fcb90d0f32eb0b6b577c8ef1b660009385b5ab68')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
    # Remove weird group authorization to write on /opt
    chmod -R g-w "${pkgdir}/opt"

    install -D -m644 "${pkgdir}/opt/Lunii/runtime/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${pkgdir}/opt/Lunii/runtime/THIRD_PARTY_README" \
            "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_README"
    install -D -m644 "${pkgdir}/opt/Lunii/runtime/ASSEMBLY_EXCEPTION" \
            "${pkgdir}/usr/share/licenses/${pkgname}/ASSEMBLY_EXCEPTION"

    install -D -m644 "${pkgdir}/opt/Lunii/Lunii.desktop" \
            "${pkgdir}/usr/share/applications/Lunii.desktop"

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
