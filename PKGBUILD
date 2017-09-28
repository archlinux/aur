# Maintainer: Paul Frazee pfrazee@gmail.com
# Contributor: flaketill <armandoibarra1 at gmail dot com>
# Upstream URL: https://github.com/beakerbrowser/beaker

pkgname=beakerbrowser
pkgver=0.7.5
pkgrel=1
pkgdesc="Beaker is an experimental peer-to-peer Web browser. It adds new APIs for \ building hostless applications, while remaining compatible with the rest of the Web"
arch=('x86_64')
url="https://beakerbrowser.com/"
license=('Modified MIT License (MIT)')

depends=('electron' 'nodejs' 'p7zip')
checkdepends=('npm')
makedepends=('libtool' 'm4' 'automake' 'make' 'git')
optdepends=('gksu: sudo-save support')

install=${pkgname}.install

#source=('git+https://github.com/beakerbrowser/beaker/archive/${pkgver}.tar.gz' \

source=('git+https://github.com/beakerbrowser/beaker.git' \
"$pkgname" \
"LICENSE" \
"${pkgname}.desktop"
)

sha256sums=('SKIP'
c81c515820bc7f402732861140905eb1ddf99cc8ac0fc6ea1f0249750ff36a21
7a0ab6f0bfde635de0dea1a5e57e641de973544ba9a5fb8498c098563ad35783
2a47f24244ad653dd52728c952c78bc39d343c9c7c697279205eab6711d9e070
)

prepare() {

	cd "${srcdir}"
	cd beaker
}

build() {

	cd "${srcdir}/beaker"
	npm install
	npm run rebuild #see https://github.com/electron/electron/issues/5851
}

check() {

	cd "${srcdir}/beaker"

	if [ -d "node_modules" ]; then
		echo "OK node modules"
	fi

	cd "${srcdir}"

	if [ -f "${pkgname}" ]; then
		echo "OK bin file"
	fi

	if [ -f "${pkgname}.desktop" ]; then
		echo "OK launcher"
	fi

	if [ -f "LICENSE" ]; then
		echo "OK launcher"
	fi

}

package() {

	cd "${srcdir}/beaker"

	#Copy icons for Desktop Integration
	#install -Dm644 build/icons/48x48.png \
    #"$pkgdir/usr/share/icons/hicolor/48x48/apps/beaker.png"
	
	cd "${srcdir}"

	echo "------------------------------------------------"
	pwd
	echo "------------------------------------------------"

	#create dirs

	mkdir -p ${pkgdir}/opt
	mkdir -p "${pkgdir}/opt/${pkgname}"

	echo -e "\033[1;31m==> Please wait until that installation is complete, Building the package... \033[1;0m \033[1;1m$1\033[1;0m" >&2

	#Copy source to /opt
	cd "${srcdir}/beaker/"
	echo "------------------------------------------------"
	pwd

	if [ -d "node_modules" ]; then
		echo "OK node modules"
	else 
		npm install
		npm run rebuild #see https://github.com/electron/electron/issues/5851
	fi

	echo "------------------------------------------------"

	cd "${srcdir}"

	if [ -d "beaker" ]; then

		echo -e "\033[1;31m==> Please wait: Copy data and files \033[1;0m \033[1;1m$1\033[1;0m" >&2

		cd "${srcdir}/beaker"

		ls

		#Before install icons and data
		#Copy icons for Desktop Integration
		install -Dm644 build/icons/48x48.png \
    	"$pkgdir/usr/share/icons/hicolor/48x48/apps/beaker.png"
	
		mv * "${pkgdir}/opt/${pkgname}/"

		#exit 1

		#cp -R --preserve=mode "beaker/*" "${pkgdir}/opt/${pkgname}/"
	fi

	#mv "${pkgdir}/beakerbrowser/*" "${pkgdir}/opt/${pkgname}/"

	#cp -rf "${srcdir}/beaker" "${pkgdir}/opt/${pkgname}"

	#cp -R --preserve=mode "${srcdir}/beaker" "${pkgdir}/opt/${pkgname}"
	#install -Dm755 "${srcdir}/beaker" "${pkgdir}/opt/${pkgname}"
	#chmod a+rx ${pkgdir}/opt/${pkgname}

	echo -e "\033[1;31m==> Copy binaries \033[1;0m \033[1;1m$1\033[1;0m" >&2

	cd "${srcdir}"

	# Install Binaries/Launchers
	install -Dm755 ${pkgname} "$pkgdir"/usr/bin/${pkgname}
	#ln -s /opt/${pkgname} ${pkgdir}/usr/bin/${pkgname}

	#copy launcher to desktop
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	#copy License
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	echo -e "\033[1;31m==> FIX permissions \033[1;0m \033[1;1m$1\033[1;0m" >&2

	# Fix wonky permissions
	chown -R $USER /usr/local
    #chown -R $USER "${pkgdir}/opt/${pkgname}/node_modules/*"
    #chown -R $USER "${pkgdir}/opt/${pkgname}/app/node_modules/*"
    #chmod 765 "${pkgdir}/opt/${pkgname}/node_modules/*"
    #chmod 765 "${pkgdir}/opt/${pkgname}/app/node_modules/*"

    chown -R $('whoami') /opt/beakerbrowser

    #find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    #find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
    #chmod 755 "${pkgdir}/opt/${pkgname}"
    
    #sudo find /opt/beakerbrowser/node_modules/* -type d -exec chmod 755 {} \;
    #find "${pkgdir}/opt/${pkgname}/node_modules/*" -type d -exec chmod 755 {} \;
    #find "${pkgdir}/opt/${pkgname}/app/node_modules/*" -type d -exec chmod 755 {} \;

    #sudo chown -R $("whoami") /opt/${pkgname}

    #find "/opt/${pkgname}/node_modules/*" -type d -exec chmod 755 {} \;
    #find "/opt/${pkgname}/app/node_modules/*" -type d -exec chmod 755 {} \;


    #which beakerbrowser

    echo -e "\033[1;31m==> The package is completed .... \033[1;0m \033[1;1m$1\033[1;0m" >&2
}