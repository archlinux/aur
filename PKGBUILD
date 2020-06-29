# Maintainer: Anna <morganamilo@gmail.com>

pkgname=superproductivity
_reponame=super-productivity
pkgver=5.4.2
pkgrel=1
pkgdesc='To Do List / Time Tracker with Jira Integration.'
arch=('x86_64')
url="http://super-productivity.com/"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'gconf' 'libxss' 'libxtst' 'nss' 'nspr' 
'xdg-utils' 'xprintidle' 'libnotify' 'libappindicator-gtk3' 'electron')
makedepends=('npm' 'yarn' 'python')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/johannesjo/${_reponame}/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('f4c8211859b8118dd58a499089f0ae8e'
         '2497ef16691da7fe4dc3c9d6ce6a8bcf'
         '6532676c1c13ae77f24205b3e3e97db9')

prepare() {
	cd "${srcdir}/${_reponame}-${pkgver}"

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
	cd "${srcdir}/${_reponame}-${pkgver}"

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
	install -Dm644 "${_reponame}-${pkgver}/app-builds/linux-unpacked/resources/app.asar" \
	 "${pkgdir}/usr/lib/${pkgname}/resources/app.asar"

	# Install start script
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	# Install shortcut
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# Installing icons
	for size in 16 32 48 128 256 512; do
		icon_file="${_reponame}-${pkgver}/build/icons/${size}x${size}.png"
		if [ -n "$icon_file" ]; then
			install -Dm644 "${icon_file}" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
		fi
	done

	# Copying Licence
	install -Dm644 "${_reponame}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
