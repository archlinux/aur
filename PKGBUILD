# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

# Watch new releases at https://forum.unity3d.com/threads/unity-on-linux-release-notes-and-known-issues.350256/

# Prevent compression of the final package since it would take too long (seriously!)
PKGEXT='.pkg.tar'

pkgname=unity-editor-bin
_version=5.6.2
_build=f3
_buildtag=2017.1.0
_nonce=061bcf22327f
pkgver="${_version}x${_build}+${_buildtag}"
pkgrel=1
pkgdesc="The world's most popular development platform for creating 2D and 3D multiplatform games and interactive experiences."
arch=('x86_64')
license=('custom')
url="https://unity3d.com/"
depends=('desktop-file-utils' 'xdg-utils' 'gcc-multilib' 'libgl' 'glu' 'nss' 'libpng12' 'libxtst' 'libpqxx' 'monodevelop' 'npm' 'alsa-lib' 'gconf')
optdepends=('ffmpeg: for WebGL exporting'
	'nodejs: for WebGL exporting'
	'java-runtime: for WebGL exporting'
	'gzip: for WebGL exporting'
	'java-environment: for Android and Tizen exporting'
	'android-sdk: for Android Remote'
	'android-udev: for Android Remote')
provides=("unity-editor=${pkgver}")
conflicts=('unity-editor')
options=(!strip)
source=("http://beta.unity3d.com/download/${_nonce}/unity-editor_amd64-${_buildtag}x${_build}Linux.deb")
sha512sums=('246e2c6e9248551f875bf5176b3206988835b86ad9e61b6f7ec1cc436615bc894bfc78fccc29bf6528d4e27a0ceee4e92a31f285616ee96ac4fb3d09137aa92b')

prepare() {
	if [[ "$(df . -BG --output=avail | awk -F'[^0-9]*' 'FNR==2 {print $2;}')" -le "10" ]]; then
		warning "It seems that you have less than 10GB left on the partition you are building on."
		warning "You might want to change the build-/cache-directory as this package is rather big."
		warning "Bear in mind that most AUR helpers build in /tmp, a potential small partition."
	fi
}

package() {
	bsdtar xf data.tar.gz

	# Moving stuff in place
	mv usr "${pkgdir}"
	mv opt "${pkgdir}"

	# Setting permissions on chrome-sandbox - necessary to run the program
	chown root:root "${pkgdir}/opt/Unity/Editor/chrome-sandbox"
	chmod 4755 "${pkgdir}/opt/Unity/Editor/chrome-sandbox"

	# Linking executables (symlinking does not work!)
	mkdir -p "${pkgdir}/usr/bin"
	#ln -s /opt/Unity/Editor/Unity "${pkgdir}"/usr/bin/unity-editor
	#ln -s /opt/Unity/MonoDevelop/bin/monodevelop "${pkgdir}"/usr/bin/unity-monodevelop
	echo -e "#!/bin/sh\nexec /opt/Unity/Editor/Unity \"$@\"" > "${pkgdir}"/usr/bin/unity-editor
	echo -e "#!/bin/sh\n\n# This prevents the editor from crashing when opening projects on some systems\nunset GTK_IM_MODULE\n\nexec /opt/Unity/MonoDevelop/bin/monodevelop \"$@\"" > "${pkgdir}/usr/bin/unity-monodevelop"
	chmod 755 "${pkgdir}/usr/bin/unity-editor" "${pkgdir}/usr/bin/unity-monodevelop"

	# Refering to the online license
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	echo "Please refer to https://unity3d.com/legal/eula for detailed license information." > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
