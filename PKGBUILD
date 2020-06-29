# Maintainer: Anna <morganamilo@gmail.com>

pkgname=superproductivity-git
_pkgname=superproductivity
_reponame=super-productivity
pkgver=5.4.2.r0.gb77473a6
pkgrel=1
pkgdesc='To Do List / Time Tracker with Jira Integration.'
arch=('x86_64')
url="http://super-productivity.com/"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'gconf' 'libxss' 'libxtst' 'nss' 'nspr' 
'xdg-utils' 'xprintidle' 'libnotify' 'libappindicator-gtk3' 'electron')
makedepends=('git' 'npm' 'yarn' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_reponame}::git+https://github.com/johannesjo/${_reponame}"
        "${_pkgname}.desktop"
        "${_pkgname}.sh")
md5sums=('SKIP'
         '2497ef16691da7fe4dc3c9d6ce6a8bcf'
         '6532676c1c13ae77f24205b3e3e97db9')

pkgver() {
	cd ${srcdir}/${_reponame}
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_reponame}"

	electronVer=$(electron --version | tail -c +2)

	# Nodejs script for package version replacement
	replacement=$(cat <<-END
			d = JSON.parse(fs.readFileSync('package.json'));
			d.devDependencies.electron = "$electronVer";
			fs.writeFileSync('package.json', JSON.stringify(d, null, 2));
	END
	)
	# Change electron version to the one in the system
	node -e "${replacement}"

	# Edit electron builder config so only the linux-unpacked package is built
	sed -i '/- AppImage/d' electron-builder.yaml
	# Replacing deb with dir
	sed -i 's/- deb/dir/' electron-builder.yaml
	sed -i '/- snap/d' electron-builder.yaml
	# No snap
	sed -i '/snap/d' electron-builder.yaml
	sed -i '/grade: stable/d' electron-builder.yaml
}

build() {
	cd "${srcdir}/${_reponame}"

	yarn --cache-folder "${srcdir}/yarn-cache"

  # Better configuration for npm cache and calling installed binaries
  export npm_config_cache="${srcdir}/npm_cache"
  
	# use system electron version
	# see: https://wiki.archlinux.org/index.php/Electron_package_guidelines
	electronDist=$(dirname $(realpath $(which electron)))
	electronVer=$(electron --version | tail -c +2)

	# Building angular
	node --max_old_space_size=4096 ./node_modules/@angular/cli/bin/ng build --aot --prod --base-href=''
	# Building electron-builder
	yarn electron:build && yarn electron-builder
	# Building the app
	npx electron-builder --linux dir --x64 --dir dist \
	 -c.electronDist="${electronDist}" -c.electronVersion="${electronVer}"
}

package() {
	cd "${srcdir}"

	# Install asar file
	install -Dm644 "${_reponame}/app-builds/linux-unpacked/resources/app.asar" \
	 "${pkgdir}/usr/lib/${_pkgname}/resources/app.asar"

	# Install start script
	install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

	# Install shortcut
	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Installing icons
	for size in 16 32 48 128 256 512; do
		icon_file="${_reponame}/build/icons/${size}x${size}.png"
		if [ -n "$icon_file" ]; then
			install -Dm644 "${icon_file}" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
		fi
	done

	# Copying Licence
	install -Dm644 "${_reponame}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
