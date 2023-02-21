# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>

pkgname=papercut-client-bin
pkgdesc="Client software for PaperCut printers"
arch=('x86_64')
license=('custom')
url="https://www.papercut.com/support/resources/manuals/ng-mf/clienttool/topics/user-client-install-linux.html"

depends=('java-runtime>=11' 'gtk3')
install="$pkgname.install"

pkgver=22.0.8
pkgrel=1
_version_prefix="22.x"
_build="65201"

# Latest release URL can be found with this redirect
# curl -LIs https://www.papercut.com/api/product/ng/latest/linux-x64/ | sed -n 's/^location: //p'

source=("papercut-client"
"config.properties.tmpl"
"https://cdn.papercut.com/web/products/ng-mf/installers/ng/$_version_prefix/pcng-setup-$pkgver.$_build.sh")

noextract=("pcng-setup-$pkgver.$_build.sh")

sha256sums=('3096295e90a23594e34ee3ff394e070ebabe15df42740cd95b27cf04adbd7ba3'
            '55e2e1ea938d8a74846b29237f66ee97a80987f2a66ff54530f31bd84b727c00'
            'c5d5839b139e08a2cd28c373211d2aca3a7a81375a620d5467e4775f9b7e7e26')

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
