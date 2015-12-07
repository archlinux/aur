#Maintainer: Dimitris Pappas <mitsakosgr@gmail.com>
pkgname=minizinc-ide
pkgver=2.0.9
pkgrel=1
pkgdesc="Simple IDE for writing and running MiniZinc models"
arch=('i686' 'x86_64')
url="http://www.minizinc.org/ide/"
license=('Mozilla Public License Version 2.0')
provides=('minizinc')
conflicts=('libminizinc')

source=('minizinc-ide.desktop'
        'minizinc.png')

source_x86_64=(https://github.com/MiniZinc/MiniZincIDE/releases/download/"${pkgver}"/MiniZincIDE-"${pkgver}"-bundle-linux-x86_64.tgz)
source_i686=(https://github.com/MiniZinc/MiniZincIDE/releases/download/"${pkgver}"/MiniZincIDE-"${pkgver}"-bundle-linux-x86_32.tgz)

md5sums=('dbc72538f4e9bfd6ca0b4dec0a013341'
         'c4aff15df2271ac84fc60b2dd9a7d192')

md5sums_x86_64=(1c39d44524bfd9bdbb45bf876b50428e)
md5sums_i686=(501dc621471cd6484da66c13c75de9e4)

package() {
    if [ "${CARCH}" == "i686" ]; then
        _arch=32;
    else
        _arch=64;
    fi

    mkdir -p "${pkgdir}"/usr/share/applications

    # Move .desktop file to global applications folder
    install "${srcdir}/"minizinc-ide.desktop "${pkgdir}"/usr/share/applications/

    mkdir -p "${pkgdir}"/usr/share/"${pkgname}"
    
    # Move png to package
    install "${srcdir}/"minizinc.png "${pkgdir}"/usr/share/"${pkgname}"

    # Move uncompressed files to package
    mv "${srcdir}/"MiniZincIDE-"${pkgver}"-bundle-linux-x86_"${_arch}"/* "${pkgdir}"/usr/share/"${pkgname}"


    # Rewrite MiniZincIDE.sh in order to change locations
    cd "$pkgdir"

    cat <<EOT > usr/share/"${pkgname}"/MiniZincIDE.sh
#!/bin/sh
export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/share/$pkgname/lib
export QT_PLUGIN_PATH=/usr/share/$pkgname/plugins
exec /usr/share/$pkgname/MiniZincIDE \$@
EOT

    # Create linkgs for minizinc and IDE
    mkdir -p usr/bin
    ln -s /usr/share/${pkgname}/MiniZincIDE.sh usr/bin/${pkgname}
    ln -s /usr/share/${pkgname}/minizinc usr/bin/minizinc
}
