# Maintainer:  Alexander Minges <alexander.minges@gmail.de>
# Contributor: Michael Schubert <mschu.dev at gmail>
# Contributor: yescalona <yescalona@ug_uchile_cl>
# Contributor: Juan Miguel Cejuela <jmcejuela@gmail.com>
# Contributor: Fabio Zanini <iosonofabio@gmail.com>

pkgname=modeller
pkgver=9.17
pkgrel=1
pkgdesc="3D Structure Homology Modeller"
arch=('i686' 'x86_64')
url="http://salilab.org/modeller/"
license=('custom')
depends=('glib2')
optdepends=('python: python support'
            'python2: python2 support')
backup=("etc/$pkgname/config.py")
source=("http://www.salilab.org/modeller/$pkgver/$pkgname-$pkgver.tar.gz"{,.sign}
        "LICENSE")
md5sums=('623e0c02fb09ade3eee3fc9101d5eb86'
         'SKIP'
         '241257feba9f2242ff445a18acab391f')
sha512sums=('d126bd069e8342683282c472db797c874b8058bcc9a3b482f06831e58ba484b43270c53bdd498d55f9f8daf6220764ad9cd44ad6d0233fe19800e662b316aa8e'
            'SKIP'
            '5ac8aeb58148a5ad387d3f2730036bd91a8e5bd6cb921dd2d2601df533fd7d6b5355f4fdc172926e76036f845873ad0d0718d1b5d13db50ade2ee5707df00c7a')
validpgpkeys=('9F7FF1477E5A2463732EC9781CC7D059745E6093')

package() {
    _MODINSTALL="/usr/lib/$pkgname"

    cd "$pkgname-$pkgver"

    case "$CARCH" in
      i686)
        _EXECUTABLE_TYPE="i386-intel8" ;;
      x86_64)
        _EXECUTABLE_TYPE="x86_64-intel8" ;;
      *)
        error "MODELLER is only available for i386 and x86_64!" ;;
    esac

    # Installing Modeller files
    install -dm755 "$pkgdir/$_MODINSTALL/"{bin,lib} "$pkgdir/usr/include"
    cp -a README INSTALLATION modlib src "$pkgdir/$_MODINSTALL"
    mv "$pkgdir/$_MODINSTALL/src/include" "$pkgdir/usr/include/$pkgname"
    ln -s "/usr/include/$pkgname" "$pkgdir/$_MODINSTALL/src/include"

    cp -a bin/*.top bin/lib "bin/mod${pkgver}_${_EXECUTABLE_TYPE}" "$pkgdir/$_MODINSTALL/bin"
    cp -a "lib/$_EXECUTABLE_TYPE" "$pkgdir/$_MODINSTALL/lib"

    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    cp -a doc examples "$pkgdir/usr/share/doc/$pkgname/"
    mv "$pkgdir/usr/share/doc/$pkgname/"{doc,html}
    ln -s "/usr/share/doc/$pkgname/html" "$pkgdir/$_MODINSTALL/doc"
    ln -s "/usr/share/doc/$pkgname/examples" "$pkgdir/$_MODINSTALL/examples"

    # Creating Modeller startup scripts
    sed -r "s|(EXECUTABLE_TYPE[0-9v]+)=x+|\1=$_EXECUTABLE_TYPE|;s|(MODINSTALL[0-9v]+)=x+|\1=\"$_MODINSTALL\"|" \
        bin/modscript > "$pkgdir/$_MODINSTALL/bin/mod$pkgver"
    sed 's|@TOPDIR@|"'"$_MODINSTALL"'"|; s|@EXETYPE@|'"$_EXECUTABLE_TYPE"'|' \
        bin/modpy.sh.in > "$pkgdir/$_MODINSTALL/bin/modpy.sh"
    sed '1s/^.*$/&2/' bin/modslave.py > "$pkgdir/$_MODINSTALL/bin/modslave.py"

    # create symlinks
    install -dm755 "$pkgdir/usr/bin"
    for _f in mod$pkgver modpy.sh modslave.py; do
      chmod +x "$pkgdir/$_MODINSTALL/bin/$_f"
      ln -sf "$_MODINSTALL/bin/$_f"  "$pkgdir/usr/bin/"
    done

    # create config.py
    install -dm755 "$pkgdir/etc/$pkgname"
    echo "license = 'XXXX'" > "$pkgdir/etc/$pkgname/config.py"
    ln -s /etc/$pkgname/config.py "$pkgdir/$_MODINSTALL/modlib/modeller/config.py"

    # add modeller libs to ld.so.conf
    install -dm755 "$pkgdir/etc/ld.so.conf.d"
    echo "/usr/lib/$pkgname/lib/$_EXECUTABLE_TYPE" > "$pkgdir/etc/ld.so.conf.d/$pkgname.conf"

    # install python modules
    for _pyver in 2.7 3.5; do
      install -dm755 "$pkgdir/usr/lib/python$_pyver/site-packages"
      ln -s "$_MODINSTALL/modlib/modeller" "$pkgdir/usr/lib/python$_pyver/site-packages/modeller"
    done
    ln -s "$_MODINSTALL/lib/$_EXECUTABLE_TYPE/python2.5/_modeller.so" "$pkgdir/usr/lib/python2.7/site-packages/_modeller.so"
    ln -s "$_MODINSTALL/lib/$_EXECUTABLE_TYPE/python3.3/_modeller.so" "$pkgdir/usr/lib/python3.5/site-packages/_modeller.so"

    # add profile.d file
    install -dm755 "$pkgdir/etc/profile.d"
    echo "export MODINSTALL${pkgver/./v}='/usr/lib/modeller'" > "$pkgdir/etc/profile.d/$pkgname.sh"
    chmod 755 "$pkgdir/etc/profile.d/$pkgname.sh"

    # install license
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Adjust directory permisssions and ownership
    find "$pkgdir" -type d -exec chmod 755 {} +
    find "$pkgdir" -exec chown --no-dereference 0:0 {} +
}
