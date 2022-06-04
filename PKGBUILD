# Maintainer: Dāvis Mosāns <davispuh at gmail dot com>

pkgname=opendj
pkgver=4.5.0
pkgrel=2
pkgdesc="OpenDJ is an LDAPv3 compliant directory service"
arch=("any")
url="https://www.openidentityplatform.org/opendj"
license=("CDDL")
depends=("java-runtime" "sh")
makedepends=("unzip" "sed" "coreutils")
source=("https://github.com/OpenIdentityPlatform/OpenDJ/releases/download/$pkgver/opendj-$pkgver.zip"
        "opendj-check-config"
        "opendj.service"
        "opendj.sysusers"
        "opendj.tmpfiles")
sha256sums=("defdb65b6f560720f0495fbf56c72af5c30033acc52c33bfad3225b43c29db01"
            "00536b0e88b0ba3ee3d7f5ddd41a07daad6d796fa0d57f4eba60f7a55d075c07"
            "70e16da40fc2971dbb9b9c8872f345b3895e510ce8e9accb6c4ccf6aa2cae6ed"
            "cf710b63f2766563b8db39669708907d5b3873d58cef5226f02c1d3599a0128b"
            "33e1986926c63488628d853f617ae956a8cb04de8f70a1d0a61897dc94f122a2")

fix_script() {
    script="$1"

    sed -i '/^cd "`dirname "${0}"`"/d' "$script"
    sed -i "/^cd ../d" "$script"
    sed -i "s|\SCRIPT_DIR=.*|SCRIPT_DIR=/usr/share/opendj/bin|" "$script"
    sed -i "s|\${SCRIPT_DIR}/../lib/|/usr/share/opendj/lib/|" "$script"
    sed -i "s|\${SCRIPT_DIR}/lib/|/usr/share/opendj/lib/|" "$script"
    sed -i "s|^INSTALL_ROOT=.*|INSTALL_ROOT=/usr/share/opendj|" "$script"
    sed -i "s|\${INSTANCE_ROOT}/lib/|/usr/share/java/opendj/|" "$script"
    sed -i "s|\${INSTALL_ROOT}/lib/\(.*\).jar|/usr/share/java/opendj/\\1.jar|" "$script"

    # Hack... Some OpenDJ tools determine install dir based on Java classpath
    # So we just add this fake entry to make it work
    sed -i "s|CLASSPATH=\"\${INSTANCE_ROOT}/classes\"|CLASSPATH=\"\${INSTANCE_ROOT}/classes:/usr/share/opendj/lib/bootstrap-client.jar\"|" "$script"
}

package() {
    cd "$srcdir/opendj"

    bindir="$pkgdir/usr/bin/"
    sharedir="/usr/share/opendj/"
    dest="$pkgdir$sharedir"
    jardir="/usr/share/java/opendj/"
    jardest="$pkgdir$jardir"

    mkdir -p "$bindir" "$dest" "$jardest"
    cp lib/*.jar -t "$jardest"
    cp -r lib/extensions "$jardest"
    cp -r * "$dest"
    rm -rf "$dest/"{bat,bin,lib,*.bat,QuickSetup.app,Uninstall.app,uninstall*}

    mkdir -p "$dest/bin" "$dest/lib"
    cp lib/*.sh "$dest/lib/"

    fix_script "$dest/setup"
    fix_script "$dest/upgrade"
    sed -i "/export SCRIPT_NAME/a SCRIPT_ARGS=\"-Dorg.opends.quicksetup.Root=/usr/share/opendj/ \${SCRIPT_ARGS}\"" "$dest/setup"
    for script in "$dest/lib/"*.sh; do
        fix_script "$script"
    done

    for script in bin/*; do
        if [ -f "$script" ] && [ "$script" != "bin/create-rc-script" ]; then
            name=$(basename "$script")
            cp "$script" "$dest/$script"
            fix_script "$dest/$script"
            ln -s "${sharedir}bin/$name" "${bindir}opendj-$name"
        fi
    done

    echo "/var/lib/opendj" > "${dest}/instance.loc"

    install -Dm 755 "../opendj-check-config" -t "${bindir}"
    install -Dm 644 "../opendj.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm 644 "../opendj.sysusers" "${pkgdir}/usr/lib/sysusers.d/opendj.conf"
    install -Dm 644 "../opendj.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/opendj.conf"

    chmod -R u+rwX,go+rX "$dest"

}

