# Contributor: thorsten w. <p@thorsten-wissmann.de>
pkgname=pdfscissors-svn
_pkgname=pdfscissors
pkgver=r28
pkgrel=1
pkgdesc='A tool to crop pdf files - built from svn and with linux optimizations'
url='https://sourceforge.net/projects/pdfscissors/'
depends=('java-runtime')
conflicts=('pdfscissors')
arch=('any')
license=('AGPL')
source=(
    "svn+https://svn.code.sf.net/p/pdfscissors/code"
    0001-Make-it-usable-on-unix.patch
    pdfscissors.desktop
)
md5sums=('SKIP'
    'cb43133f7846665401c7f228e2c0906d'
    'a0271a826bfca97cd82de1304f8c5212'
)
_svnmod=code

pkgver() {
    cd ${_svnmod}
    local ver="$(svnversion)"
    printf r%s "${ver//[[:alpha:]]}"
}

prepare() {
    cd "$srcdir"
    cd "${_svnmod}"
    # ignore the exit status of patch, because otherwise
    # this fails when calling 'makepkg' multiple times
    patch -N -r /dev/null -p1 -i ../0001-Make-it-usable-on-unix.patch || true
}

build() {
    cd "$srcdir"
    cd "${_svnmod}"

    javac -cp lib/itextpdf-5.0.4.jar:lib/jpedal-4.37b36.jar \
        $(find src/bd/amazed/pdfscissors/ -name '*.java' )

    pushd src
    jar -cf ../pdfscissors.jar \
        $(find bd/amazed/pdfscissors/ -name '*.class' )
    popd
    pushd res
    jar -uf ../pdfscissors.jar \
        *.png
    popd
}

package() {
    cd "$srcdir"
    cd "${_svnmod}"

    mkdir -p ${pkgdir}/usr/{bin,share/${_pkgname}}
    mkdir -p ${pkgdir}/usr/share/applications/
    install -m644 $srcdir/${_pkgname}.desktop ${pkgdir}/usr/share/applications/
    install -m644 lib/*.jar ${_pkgname}.jar ${pkgdir}/usr/share/${_pkgname}/
    cat > ${pkgdir}/usr/bin/pdfscissors <<EOF
#!/bin/sh
dir=/usr/share/${_pkgname}
cp=\$dir/pdfscissors.jar
cp="\$cp:\$dir/itextpdf-5.0.4.jar"
cp="\$cp:\$dir/jpedal-4.37b36.jar"
exec java -cp "\$cp" bd.amazed.pdfscissors.main.PdfscissorsMain "\$@"
EOF
    chmod +x ${pkgdir}/usr/bin/pdfscissors
}

