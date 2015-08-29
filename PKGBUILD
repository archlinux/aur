# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=unity-editor-bin
pkgver=5.1.0f3+2015082501
pkgrel=1
pkgdesc="Editor for the Unity Game Engine"
arch=('x86_64')
license=('custom')
url="https://unity3d.com/"
depends=('desktop-file-utils' 'qt5-base' 'python' 'python2' 'gconf' 'lib32-libxcursor' 'lib32-libgl'
         'lib32-libxrandr' 'postgresql-libs' 'lib32-openssl' 'ruby' 'glu' 'nss' 'libxtst')
optdepends=('ffmpeg: for WebGL exporting'
            'nodejs: for WebGL exporting'
            'java-runtime: for WebGL exporting'
            'gzip: for WebGL exporting'
            'java-environment: for Android and Tizen exporting'
            'monodevelop: enable unity monodevelop'
            'android-sdk: for Android Remote'
            'android-udev: for Android Remote')
provides=('unity-editor')
conflicts=('unity-editor')
options=(!strip)
install=${pkgname}.install
source=("https://unity3d.com/legal/eula"
        "http://download.unity3d.com/download_unity/unity-editor-${pkgver}_amd64.deb")
md5sums=('f68446e7a0fd66e63d5506be00e88d43'
         'c1c559bb684d00369ee6710be01c3700')

# Prevent compression of the final package since it would take too long (sereausly!)
PKGEXT='.pkg.tar'

package() {
    bsdtar xf data.tar.gz

    # Moving stuff in place
    mv usr "${pkgdir}"
    mv opt "${pkgdir}"

    # Setting permissions on chrome-sandbox - necessary to run the program
    chown root:root "${pkgdir}"/opt/Unity/Editor/chrome-sandbox
    chmod 4755 "${pkgdir}"/opt/Unity/Editor/chrome-sandbox

    # Linking binaries
    mkdir -p "${pkgdir}"/usr/bin
    echo -e "#!/bin/sh\nexec /opt/Unity/Editor/Unity \"$@\"" > "${pkgdir}"/usr/bin/unity-editor
    echo -e "#!/bin/sh\nexec /opt/Unity/MonoDevelop/bin/monodevelop \"$@\"" > "${pkgdir}"/usr/bin/unity-monodevelop
    chmod 755 "${pkgdir}"/usr/bin/unity-editor "${pkgdir}"/usr/bin/unity-monodevelop

    # Moving the license in place
    install -Dm644 "${srcdir}/eula" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
