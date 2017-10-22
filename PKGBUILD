# Maintainer: Paul Frazee pfrazee@gmail.com
# Contributor: flaketill <armandoibarra1 at gmail dot com>
# Upstream URL: https://github.com/beakerbrowser/beaker
# Web site="https://beakerbrowser.com/"

_pkgname=beaker
pkgname=beakerbrowser
pkgver=0.7.5
pkgrel=1
pkgdesc="Beaker is an experimental peer-to-peer Web browser. It adds new APIs for \ building hostless applications, while remaining compatible with the rest of the Web"
arch=('x86_64')

url="https://github.com/beakerbrowser/beaker"
license=('Modified MIT License (MIT)')
depends=('electron' 'nodejs' 'p7zip' 'xdg-utils')
checkdepends=('npm')
makedepends=('libtool' 'm4' 'automake' 'make' 'git')
optdepends=('gksu: sudo-save support')

install=${pkgname}.install

source=("$pkgname"
	"LICENSE"
	"${pkgname}.desktop")

sha256sums=(
c81c515820bc7f402732861140905eb1ddf99cc8ac0fc6ea1f0249750ff36a21
7a0ab6f0bfde635de0dea1a5e57e641de973544ba9a5fb8498c098563ad35783
2a47f24244ad653dd52728c952c78bc39d343c9c7c697279205eab6711d9e070
)

msg_blue()
{
    printf "${BLUE}==>${ALL_OFF}${BOLD}·$1${ALL_OFF}\n"
}

prepare() {
	
	msg_blue "Connecting to git server..."
	msg_blue "Please wait ..."	
	
	if [[ -d "$srcdir/$_pkgname" ]]; then
        	(cd "$_pkgname" && git pull origin master) || return 1
        	msg_blue "Repository updated"
	else
		git clone "$url.git" || return 1
		msg "Repository cloned"
		ls
		sleep 2
		pwd
		sleep 2
		
	fi

}

build() {
	
	if [[ -d "$srcdir/$_pkgname" ]]; then
		cd "${srcdir}/$_pkgname"
		msg_blue "Checkout to version $pkgver"
		git checkout $pkgver 2>/dev/null || return 1
		msg_blue "Git status .."
		git status
		msg_blue "Using version $pkgver..."
		npm install
		npm run rebuild || return 1 #see https://github.com/electron/electron/issues/5851
	fi
}

check() {
	if [[ -d "$srcdir/$_pkgname" ]]; then

		cd "${srcdir}/$_pkgname"

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

		#return 1
	fi

}

package() {

	cd "${srcdir}/$_pkgname"

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

		#Before install icons and data
		#Copy icons for Desktop Integration
		install -Dm644 build/icons/48x48.png \
    	"$pkgdir/usr/share/icons/hicolor/48x48/apps/beaker.png"
	
		mv * "${pkgdir}/opt/${pkgname}/"

	fi

	echo -e "\033[1;31m==> Copy binaries \033[1;0m \033[1;1m$1\033[1;0m" >&2

	cd "${srcdir}"

	# Install Binaries/Launchers
	install -Dm755 ${pkgname} "$pkgdir"/usr/bin/${pkgname}

	#copy launcher to desktop
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	#copy License
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	echo -e "\033[1;31m==> FIX permissions \033[1;0m \033[1;1m$1\033[1;0m" >&2

	# Fix wonky permissions
	if [ -d "/opt/beakerbrowser" ]; then
	
		chown -R $USER /usr/local
		chown -R $('whoami') /opt/beakerbrowser
	fi

    echo -e "\033[1;31m==> The package is completed .... \033[1;0m \033[1;1m$1\033[1;0m" >&2
}