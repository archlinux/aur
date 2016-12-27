# Maintainer: Tommy Shem
#
# Notes
# Apple website on how to import gpg key -> https://swift.org/download/#using-downloads
#
# Command to do it if you have wget installed. (Warning do not use sudo or root)
# wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import -
# or type command below if wget not installed.
# gpg --keyserver hkp://pool.sks-keyservers.net \
#      --recv-keys \
#      '7463 A81A 4B2E EA1B 551F  FBCF D441 C977 412B 37AD' \
#      '1BE1 E29A 084C B305 F397  D62A 9F59 7F4D 21A5 6D5F' \
#      'A3BA FD35 56A5 9079 C068  94BD 63BC 1CFE 91D3 06C6'

# ncurses5-compat-libs
# import gpg key with command below. (Warning do not use sudo or root)
# gpg --keyserver pgp.mit.edu --recv-keys C52048C0C0748FEE227D47A2702353E0F7E48EDB
#
# If you do not want pgp key to be checked and have yaourt installed
# yaourt --m-arg "--skippgpcheck" -Sb ncurses5-compat-libs 
 
# Variables
_snapshot=DEVELOPMENT-SNAPSHOT
_version=2016-12-01-a
_ubuntuYear=16
_ubuntuMonth=10

# Package info
pkgname=swift-development-bin
pkgver=${_version//-/.}
pkgrel=1
pkgdesc="Swift programming language. Development snapshot binary re-packaged for arch from Apple official website"
arch=('x86_64')
url="https://swift.org"
license=('Apache')

depends=(
  'clang'
  'libxml2'
  'python2'
  'libutil-linux'
  'libedit'
  'libbsd'  
  'git'
  'curl'
  'openssl'
  'sqlite'
  'swig'
  'libtool'
  'icu57'  #AUR
  'ncurses5-compat-libs' # AUR
#  'libkqueue' # AUR might be needed
#  'uuid'  # Aur
)

provides=(
  'swift-language'
  'lldb'
  'swift-lldb'
)

conflicts=(
  'lldb'
  'swift-lldb'
  'swift-language-git'
  'swift-bin'
  'swift-git'
  'swift'
)

# By default makepkg runs strip on binaries. This seems to cause issues with the Swift REPL.
# Disable it in the PKGBUILD with:
options=('!strip')
#They must be uppercase and must not contain whitespace characters.
validpgpkeys=('7463A81A4B2EEA1B551FFBCFD441C977412B37AD')

replaces=('swift-language-bin')

source=(
  "https://swift.org/builds/development/ubuntu${_ubuntuYear}${_ubuntuMonth}/swift-${_snapshot}-${_version}/swift-${_snapshot}-${_version}-ubuntu${_ubuntuYear}.${_ubuntuMonth}.tar.gz"
  "https://swift.org/builds/development/ubuntu${_ubuntuYear}${_ubuntuMonth}/swift-${_snapshot}-${_version}/swift-${_snapshot}-${_version}-ubuntu${_ubuntuYear}.${_ubuntuMonth}.tar.gz.sig"
# "swift.conf"
)

sha256sums=('831a555ea0757d78373a38eeb12970e8b1980366a449c3b563deb447e7ff2f55'
            '3f83974a563b0fa7c06fd2f35907128998d09cd80d1f983719439ce95225df2b'
#            'c93a77b3a9b2647266a5ccdbe77f47d51cb7051d23ee7cca6258564daf713f35'
)

package() {
    tar -C "$pkgdir" -xf "swift-${_snapshot}-${_version}"*.tar.gz --strip 1

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove all unnecessary stuff
    rm -rf "${pkgdir}/usr/local"

    # Yuck! patching libedit SONAME
    find "${pkgdir}/usr/bin" -type f -exec sed -i 's/libedit\.so\.2/libedit\.so\.0/g' {} \;
    find "${pkgdir}/usr/lib" -type f -exec sed -i 's/libedit\.so\.2/libedit\.so\.0/g' {} \;

    # fool packages looking to link to libraries
#    ln -s /usr/lib/libformw.so.6.0 "$pkgdir/usr/lib/libform.so.5"
#    ln -s /usr/lib/libpanelw.so.6.0 "$pkgdir/usr/lib/libpanel.so.5"
    # symlink newer libraries of icu
    # not needed now icu57 is installed
#    ln -s /usr/lib/libicuuc.so.58.1 "$pkgdir/usr/lib/libicuuc.so.57"
#    ln -s /usr/lib/libicui18n.so.58.1 "$pkgdir/usr/lib/libicui18n.so.57"
#    ln -s /usr/lib/libicudata.so.58.1 "$pkgdir/usr/lib/libicudata.so.57"
#    ln -s /usr/lib/libicuio.so.58.1 "$pkgdir/usr/lib/libicuio.so.57"


    # remove the six.py dumped in python's site packages
    rm "${pkgdir}/usr/lib/python2.7/site-packages/six.py"

    # Ensure the items have the right permissions..
    # some tarballs from upstream seem to have the wrong ones
    find "${pkgdir}/usr/bin" -type f -exec chmod a+rx {} \;
    find "${pkgdir}/usr/lib" -type f -exec chmod a+r {} \;

    # Update glibc map paths
    sed -i 's/\/x86_64-linux-gnu//g' "${pkgdir}/usr/lib/swift/linux/x86_64/glibc.modulemap"

    # Adds swift libs to the ldpath
    # install -Dm644 $srcdir/swift.conf
    # $pkgdir/etc/ld.so.conf.d/swift.conf

    # Move license
    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    mv ${pkgdir}/usr/share/swift/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
}
