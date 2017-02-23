# Maintaier: Peter Babič <babicpet at gmail dot com>
pkgname=scriptbasic
pkgver=2.1_RC1
pkgrel=4
pkgdesc="Scriba compiler for a powerful scripting language/API"
arch=("x86_64")
url="http://www.scriptbasic.org/"
license=('unknown')
depends=('postgresql-libs')
install=".install"
source=("http://www.scriptbasic.org/download/SB_${pkgver}_Linux.tar.gz"
        "scriptbasic_arch.patch"
        "configure.save")
noextract=()
md5sums=('374a37fff435d26c08cfe2ed8d694a8e'
         'f026797fd8e695a797e1eee2f04e264a'
         'fc077e744f5000c5e508243b35f348f2')
validpgpkeys=()

prepare() {
#       perl jamal.pl -i
        chmod -R 755 "scriptbasic"
        cp configure.save scriptbasic/
        patch -p0 -i "scriptbasic_arch.patch"
}

build() {
      	cd "scriptbasic"
      	./setup
        make clean
        ./setup
        ./setup --install --load
        bin/exe/scriba -k -f basic.conf scriba.conf.unix.lsp
}

package() {
      	cd "scriptbasic"
        install -m666 -d "$pkgdir/var/log/scriba/"
        install -m555 -d "$pkgdir/etc/scriba/"
        install -m777 -d "$pkgdir/var/cache/scriba/cache/"
        install -m777 -d "$pkgdir/var/cache/scriba/hebtemp/"

        install -Dm555 "bin/exe/scriba" "$pkgdir/usr/bin/scriba"
        install -Dm555 "bin/exe/sbhttpd" "$pkgdir/usr/bin/sbhttpd"
#        install -Dm777 "etc-init.d-sbhttpd" "$pkgdir/etc/init.d/sbhttpd"

        install -Dm444 "basic.conf" "$pkgdir/etc/scriba/basic.conf"
        install -Dm444 "heber.bas" "$pkgdir/usr/share/scriba/source/heber.bas"
        install -Dm444 "bin/lib/libscriba.a" "$pkgdir/usr/local/lib/libscriba.a"

        install -m555 -d "$pkgdir/usr/share/scriba/include/"
        install -Dm444 include/*.bas "$pkgdir/usr/share/scriba/include/"

        install -m555 -d "$pkgdir/usr/local/lib/scriba/"
        install -Dm644 bin/mod/dll/*.so "$pkgdir/usr/local/lib/scriba/"

        extensions=(cgi curl curses dbg gd hash mt mysql odbc re sdbg t trial ux xml zlib)
        for i in "${extensions[@]}"
        do
          sourceDir="extensions/$i/mod_$i/"
          destDir="$pkgdir/usr/share/scriba/source/mod_$i/"
          if [ -d "$sourceDir" ]; then
            install -m555 -d "$destDir"
            install -Dm644 "$sourceDir"*.html "$destDir"
          fi

          indexFile="bin/texi/mod_$i.html"
          if [ -f "$indexFile" ]; then
            install -Dm644 "$indexFile" "$pkgdir/usr/share/scriba/source/"
          fi

          basFile="extensions/$i/$i.bas"
          if [ -f "$basFile" ]; then
            install -Dm644 "$basFile" "$pkgdir/usr/share/scriba/include/$i/$i.bas"
          fi

        done

}
