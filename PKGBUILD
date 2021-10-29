pkgname="lejos-nxj-bin"
pkgver="0.9.1beta_3"
pkgrel=1
pkgdesc="Tiny Java Virtual Machine ported to the LEGO NXT brick"
arch=("x86_64")
url="https://lejos.sourceforge.io/nxj.php"
license=("GPL")
depends=("jdk8-openjdk")
conflicts=("lejos-nxj")
replaces=("lejos-nxj")
source=("https://downloads.sourceforge.net/project/nxt.lejos.p/0.9.1beta-3/leJOS_NXJ_0.9.1beta-3.tar.gz"
        "https://archive.apache.org/dist/ant/source/apache-ant-1.6.5-src.tar.gz")
sha256sums=("f10234b60f98c7449b6e0102dc06a01f3a96af44354416b56a2206bae04d94a2"
            "ca311ad9c282a6d9a57d3deb776e87a41f87cdf3b7710b29a1806e1629d0cd57")

build() {
    cd apache-ant-1.6.5
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk ./build.sh
    export _ANTPATH=$(pwd)/dist/bin
    cd ../leJOS_NXJ_0.9.1beta-3/build
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk ant
}

package() {
    cd leJOS_NXJ_0.9.1beta-3
    mkdir -p "$pkgdir/opt/leJOS_NXJ" "$pkgdir/etc/udev/rules.d"
    cp -r * "$pkgdir/opt/leJOS_NXJ"
    bash -c "groupadd lego 2>/dev/null; echo; echo \"==> IMPORTANT: ADD YOURSELF TO THE GROUP lego!\"; echo"
    echo "SUBSYSTEM==\"usb\", DRIVER==\"usb\", ATTRS{idVendor}==\"0694\" ATTRS{idProduct}==\"0002\", GROUP=\"lego\", MODE=\"0660\"" > "$pkgdir/etc/udev/rules.d/70-lego.rules"
    echo "SUBSYSTEM==\"usb\", DRIVER==\"usb\", ATTRS{idVendor}==\"03eb\" ATTRS{idProduct}==\"6124\", GROUP=\"lego\", MODE=\"0660\"" >> "$pkgdir/etc/udev/rules.d/70-lego.rules"
    chmod 644 "$pkgdir/etc/udev/rules.d/70-lego.rules"
}
