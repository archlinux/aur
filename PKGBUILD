# Maintainer: eomanis at web dot de

pkgname='tigervnc-viewer-java'
pkgver=1.8.0
pkgrel=1
pkgdesc="TigerVNC Viewer, Java version"
arch=('any')
url='http://tigervnc.org/'
license=('GPL')
depends=('java-runtime>=7')
source=("VncViewer-${pkgver}.jar::https://bintray.com/tigervnc/stable/download_file?file_path=VncViewer-${pkgver}.jar"
        "tigervnc-${pkgver}.tar.gz::https://github.com/TigerVNC/tigervnc/archive/v${pkgver}.tar.gz"
        "tigervnc-viewer-java.desktop")
sha256sums=('f3cfe4ab2c1131f339a780ca0f881b2eea023643f382a7b58cc0f600715d1852'
            '9951dab0e10f8de03996ec94bec0d938da9f36d48dca8c954e8bbc95c16338f8'
            'da791662d9ca369af5526c325b1514019ca8675f2de5dd3981ec2b983d6d9cd5')
noextract=("VncViewer-${pkgver}.jar"
           "tigervnc-${pkgver}.tar.gz"
           "tigervnc-viewer-java.desktop")

package() {
    
    # Place the .jar file and create a non-versioned symlink to it
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    cp -t . "${srcdir}/VncViewer-${pkgver}.jar"
    chmod u=rwx,go=rx "VncViewer-${pkgver}.jar"
    ln -s "/usr/bin/VncViewer-${pkgver}.jar" "VncViewer.jar"
    
    # Extract and place the icon
    # We are too lazy to generate all the various resolutions and instead just
    # extract the scalable SVG version - close enough
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    cd "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    gzip --decompress --stdout - < "${srcdir}/tigervnc-${pkgver}.tar.gz" \
        | tar --extract --to-stdout "tigervnc-${pkgver}/media/tigervnc.svg" \
        > tigervnc-viewer-java.svg
    chmod u=rw,go=r tigervnc-viewer-java.svg
    
    # Place the .desktop file
    mkdir -p "${pkgdir}/usr/share/applications"
    cd "${pkgdir}/usr/share/applications"
    cp -t . "${srcdir}/tigervnc-viewer-java.desktop"
    chmod u=rw,go=r "tigervnc-viewer-java.desktop"
}
