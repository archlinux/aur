# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=ghc-pristine
pkgver=8.6.5
pkgrel=1
pkgdesc="Symlinks to GHC with only boot libs, useful for building static binaries (see PKGBUILD for details)"
arch=(any)
url=https://www.haskell.org/ghc/
license=(custom)
depends=(ghc)
optdepends=("ghc-static: needed to build static binaries")

# This package provides symbolic links to the Glasgow Haskell Compiler, but
# with the global package database restricted to only boot libraries.  This is
# useful for building statically linked executables without interference from
# the official haskell-* packages, which only offer dynamic libraries and
# makes cabal hopelessly confused.
#
# See also: https://wiki.archlinux.org/index.php/Haskell#Static_linking
#
# To use this package, make sure ghc-static is installed and the flag
# --with-compiler=/usr/share/ghc-pristine/bin/ghc
# is passed to all cabal invocations.  You can also add this to your
# ~/.cabal/config file.
#
# For cabal new-builds, you just need to run this command once:
# cabal v2-configure --with-compiler=/usr/share/ghc-pristine/bin/ghc

pkgver() {
    ghc --version | sed -n 's/^.*version \([0-9.]*\)/\1/p'
}

package() {
    prefix=/usr/share/ghc-pristine
    mkdir -p "$pkgdir$prefix/bin/" "$pkgdir$prefix/lib/package.conf.d/"
    ver=`pacman -Q ghc`
    ver=${ver#* }
    ver=${ver%-*}
    pacman -Ql ghc ghc-libs | while read -r line; do
        f=${line#* }
        f=${f%/}
        case $f in
            /usr/bin/*)
                if [ -L "$f" ]; then
                    cp -P "$f" "$pkgdir$prefix/bin/"
                else
                    head=`head -c 2 "$f"`
                    if [ "$head" = "#!" ]; then
                        n=`basename "$f"`
                        cp -p "$f" "$pkgdir$prefix/bin/"
                        sed -i 's?topdir=.*?topdir="'"$prefix"'"/lib?;s?exec "/usr/bin/ghc?exec "'"$prefix"'/bin/ghc?' "$pkgdir$prefix/bin/$n"
                    fi
                fi
                ;;
            /usr/lib/ghc-$ver/package.conf.d/*.conf)
                ln -fs "$f" "$pkgdir$prefix/lib/package.conf.d/"
                ;;
            /usr/lib/ghc-$ver/*-*.*.*)
                ;;
            /usr/lib/ghc-$ver/package.conf.d)
                ;;
            /usr/lib/ghc-$ver/*/*)
                ;;
            /usr/lib/ghc-$ver/*)
                ln -fs "$f" "$pkgdir$prefix/lib/"
                ;;
        esac
    done
    ghc-pkg -f "$pkgdir$prefix/lib/package.conf.d" recache
    mkdir -p "$pkgdir/usr/share/licenses/ghc-pristine"
    ln -fs ../ghc-libs/LICENSE "$pkgdir/usr/share/licenses/ghc-pristine"
}
