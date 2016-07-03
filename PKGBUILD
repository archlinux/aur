# Maintainer: Kevin MacMartin <prurigro at gmail dot com>
# Contributor: PedroHCL (https://github.com/PedroHLC)

pkgname=archon
pkgver=2.1.0
pkgrel=9
pkgdesc='Execute Android APKs'
arch=('i686' 'x86_64' 'armv7h')
url='http://archon-runtime.github.io'
license=('Apache' 'custom')
options=('!strip')
depends=('chromium')
makedepends=('git' 'openssl')
optdepends=('archon-exec: wrapper script for launching android apk files'
            'chromeos-apk: extract and convert android apks into archon apks'
            'google-chrome: run the archon extension the same as chromium')

_installpath=/opt/$pkgname
_extension_paths=('/usr/share/chromium/extensions' '/usr/share/google-chrome/extensions')

source_i686=("http://archon.vf.io/ARChon-v$pkgver-x86_32.zip")
sha512sums_i686=('23cd42c41a6bfb2a6bffcd42efbb3f32c781609a7b4ed01c716ca817213298e0bd83550759b0e4979703d9011e40e54faf9fe8b64eba260637909dc6296f8dcc')
source_x86_64=("http://archon.vf.io/ARChon-v$pkgver-x86_64.zip")
sha512sums_x86_64=('16ce5d52b7835e4eb755c3bd3e99db3dabdeec5f93c6812400fc25f7ff8e2be878e678f4404def3a180ec3f5354f6d5b5470832f3626d7a95efc131c80ccae5e')

prepare() {
  # Create a symlink to the archon directory with a common name
  for dir in ./*archon*; do
    [[ -d "$dir" ]] && ln -sf "$dir" $pkgname
  done

  # Increase the application font size by 1.2 times (the default is a bit too small)
  sed -i 's|window\.devicePixelRatio|1\.2\*window\.devicePixelRatio|' $pkgname/gen_{index,main}.min.js
}

build() {
  # Generate the extension
  chromium --pack-extension=$pkgname

  # Write the plugin metadata file
  printf '%s\n' '{"external_crx": "'"$_installpath/$pkgname"'.crx", "external_version": "'"$(egrep '^\s*"version"' $pkgname/manifest.json | sed 's|^\s*"version": "||;s|",$||')"'"}' \
    > pluginid.json
}

package() {
  # Install the ARChon license files
  install -Dm644 $pkgname/NOTICE.{html,txt} -t "$pkgdir/usr/share/licenses/$pkgname"

  # Install the ARChon extension
  install -Dm755 $pkgname.crx "$pkgdir$_installpath/$pkgname.crx"

  # Install the ARChon app files
  cp -r --no-preserve=ownership $pkgname/* "$pkgdir$_installpath"/

  # Generate the filename for the plugin metadata file using its extension id
  _extension_file="$(openssl rsa -pubout -outform DER < ${pkgname}.pem \
    | sha256sum \
    | head -c32 \
    | tr 0-9a-f a-p).json"
  # Install the plugin metadata file to each extension folder
  for _path in "${_extension_paths[@]}"; do
      install -Dm644 pluginid.json "$pkgdir$_path"/$_extension_file
  done
}
