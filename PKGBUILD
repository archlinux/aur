# Maintainer: Kevin MacMartin <prurigro at gmail dot com>
# Contributor: PedroHCL (https://github.com/PedroHLC)

pkgname=archon
pkgver=1.2
pkgrel=8
pkgdesc="Execute Android APKs"
arch=('i686' 'x86_64' 'armv7h')
url="https://bitbucket.org/vladikoff/archon"
license=('Apache' 'custom')
options=('!strip')
depends=('chromium')
makedepends=('git' 'openssl')
optdepends=('archon-exec: wrapper script for launching android apk files'
            'chromeos-apk: extract and convert android apks into archon apks'
            'google-chrome: run the archon extension the same as chromium')

_installpath="/opt/$pkgname"
_extension_paths=('/usr/share/chromium/extensions' '/usr/share/google-chrome/extensions')
case $CARCH in
    i686)   _tag="x86_32" ;;
    armv7h) _tag="ARM"    ;;
    x86_64) _tag="$CARCH"
            pkgver=2.1.0  ;;
esac
_tag="v${pkgver}-${_tag}"

source=("git+${url}.git#tag=${_tag}")
sha512sums=('SKIP')

prepare() {
    # Increase the application font size by 1.2 times (the default is a bit too small)
    sed -i 's|window\.devicePixelRatio|1\.2\*window\.devicePixelRatio|' $pkgname/gen_{index,main}.min.js
}

build() {
    # Generate the extension
    chromium --pack-extension=$pkgname

    # Write the plugin metadata file
    echo '{"external_crx": "'"$_installpath/$pkgname"'.crx", "external_version": "'"$(egrep '^\s*"version"' $pkgname/manifest.json | sed 's|^\s*"version": "||;s|",$||')"'"}' \
        > pluginid.json
}

package() {
    # Install the ARChon license files
    install -Dm644 $pkgname/NOTICE.{html,txt} -t "$pkgdir"/usr/share/licenses/$pkgname

    # Install the ARChon extension
    install -Dm755 ${pkgname}.crx "$pkgdir$_installpath"/${pkgname}.crx

    # Install the ARChon app files
    cp -r --no-preserve=ownership $pkgname/* "$pkgdir$_installpath"/

    # Generate the filename for the plugin metadata file using its extension id
    _extension_file="$(openssl rsa -pubout -outform DER < ${pkgname}.pem \
        | sha256sum \
        | head -c32 \
        | tr 0-9a-f a-p).json"
    # Install the plugin metadata file to each extension folder
    for _path in ${_extension_paths[@]}; do
        install -Dm644 pluginid.json "$pkgdir$_path"/$_extension_file
    done
}
