# Maintainer: eomanis at web dot de

pkgname='tigervnc-viewer-java'
pkgver=1.9.0
pkgrel=1
pkgdesc="TigerVNC Viewer, Java version"
arch=('any')
url='http://tigervnc.org/'
license=('GPL')
depends=('java-runtime>=7')
source=("VncViewer-${pkgver}.jar::https://bintray.com/tigervnc/stable/download_file?file_path=VncViewer-${pkgver}.jar"
        "tigervnc-${pkgver}.tar.gz::https://github.com/TigerVNC/tigervnc/archive/v${pkgver}.tar.gz"
        "tigervnc-viewer-java.desktop")
sha256sums=('6fdc56b88f06cc1e1ab0ecfe76b52e1b334873ed8c886dd8e846fd0e070cc044'
            'f15ced8500ec56356c3bf271f52e58ed83729118361c7103eab64a618441f740'
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
