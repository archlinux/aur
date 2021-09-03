# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>

pkgname=papercut-client-bin
pkgdesc="Client software for PaperCut printers"
arch=('x86_64')
license=('custom')
url="https://www.papercut.com/support/resources/manuals/ng-mf/clienttool/topics/user-client-install-linux.html"

depends=('java-runtime' 'gtk3')
install="$pkgname.install"

pkgver=21.1.1
pkgrel=2
_version_prefix="21.x"
_build="57910"

source=("papercut-client"
"config.properties.tmpl"
"https://cdn.papercut.com/web/products/ng-mf/installers/ng/$_version_prefix/pcng-setup-$pkgver.$_build.sh")

noextract=("pcng-setup-$pkgver.$_build.sh")

sha256sums=('3096295e90a23594e34ee3ff394e070ebabe15df42740cd95b27cf04adbd7ba3'
            '55e2e1ea938d8a74846b29237f66ee97a80987f2a66ff54530f31bd84b727c00'
            '5cabf5a3936693a5f355fc4ec51d12c708703409346ced02a047a17ad3a2cac7')

# App Configuration
# Either edit here or in $HOME/.config/papercut-client/config.properties
_print_server="print.example.com"
_print_port="9191"

prepare() {
    # Extract archive from script
    dd if="pcng-setup-$pkgver.$_build.sh" bs=4096 skip=1 | bsdtar -C "$srcdir" -xzf -
}

package() {
    _install_dir="$pkgdir/usr/share/$pkgname"

    # Create installation directory
    install -d "$_install_dir"

    # Copy libraries
    cp -r "$srcdir/papercut/client/win/lib" "$_install_dir"
    rm "$_install_dir/lib/clientjni.dll" "$_install_dir/lib/pc-toast-notify.exe"

    # Create minimal config
    cat << EOF > "$_install_dir/config.properties"
#Bootstrap configuration information
#$(date)
server-name=$_print_server
server-ip=$_print_server
server-port=$_print_port
EOF

    # Create advanced config template
    cat "$_install_dir/config.properties" \
    "$srcdir/config.properties.tmpl" > "$_install_dir/config.properties.tmpl"

    # Install LICENSE
    install -D -m644 "$srcdir/papercut/LICENCE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install launcher script
    install -D -m755 papercut-client "$pkgdir/usr/bin/papercut-client"
}
