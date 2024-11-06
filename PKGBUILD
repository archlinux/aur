# Maintainer: metoj <baltodom0@gmail.com>
# Based on PKGBUILD for Brother TD-4100N by Karol Babioch

pkgname='brother-td4520dn'
pkgver=3.2.0
pkgrel=1
pkgdesc='LPR and CUPS driver for Brother TD-4520DN label printer'
url='http://solutions.brother.com/linux/en_us/'
arch=('i686' 'x86_64')
license=('custom')
depends=('cups')
if [ "$CARCH" = 'x86_64' ]; then
  depends+=('lib32-glibc')
fi
install="$pkgname.install"

source=("https://download.brother.com/welcome/dlfp100713/td4520dnpdrv-$pkgver-$pkgrel.i386.rpm"
        'LICENSE')
sha256sums=('6e2e85da66670cf8967d970a7cf2f9e78befd584d3deb0543bed458bb73b2ede'
            'cdd1955a9996bc246ba54e84f0a5ccbfdf6623962b668188762389aa79ef9811')

prepare() {
  # Extract the contents of the RPM package
  bsdtar -xf "${srcdir}/td4520dnpdrv-$pkgver-$pkgrel.i386.rpm" -C "${srcdir}"

  # Move files out of /usr/local and into standard directories
  if [ -d "$srcdir/usr/local/Brother" ]; then
    install -d "$srcdir/usr/share"
    mv "$srcdir/usr/local/Brother" "$srcdir/usr/share/brother"
    rm -rf "$srcdir/usr/local"
    sed -i 's|/usr/local/Brother|/usr/share/brother|g' $(grep -lr '/usr/local/Brother' ./)
  fi

  # Setup CUPS directories
  install -d "$srcdir/usr/share/cups/model"
  install -d "$srcdir/usr/lib/cups/filter"

  # Locate the cupswrapper file and adjust installation paths
  cd $(find . -type d -name 'cupswrapper')
  if [ -f cupswrapper* ]; then
    _wrapper_source=$(ls cupswrapper*)
    sed -i '/^\/etc\/init.d\/cups/d' "$_wrapper_source"
    sed -i '/^sleep/d' "$_wrapper_source"
    sed -i '/^echo lpadmin/d' "$_wrapper_source"
    sed -i '/^lpadmin/d' "$_wrapper_source"
    sed -i 's|/usr|$srcdir/usr|g' "$_wrapper_source"
    sed -i 's|/opt|$srcdir/opt|g' "$_wrapper_source"
    sed -i 's|/model/Brother|/model|g' "$_wrapper_source"
    sed -i 's|lpinfo|echo|g' "$_wrapper_source"
    export srcdir=$srcdir
    ./"$_wrapper_source"
    sed -i 's|$srcdir||' "$srcdir/usr/lib/cups/filter/brother_lpdwrapper_td4520dn"
    rm "$_wrapper_source"
  fi

  # /etc/printcap is managed by cups
  rm $(find "$srcdir" -type f -name 'setupPrintcap*')
}

package() {
  cd "$srcdir"

  cp -R usr "$pkgdir"
  if [ -d opt ]; then cp -R opt "$pkgdir"; fi

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
