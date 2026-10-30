# Maintainer: Reasonance team
#
# Il pacchetto AUR `reasonance-bin`: installa il binario della release pubblicata su
# RSNNC/reasonance-build. Lo aggiorna da sé `release.yml` (job `aur`) a ogni versione MAGGIORE:
# `pkgver` e `sha256sums` qui sotto li riscrive la pipeline; nel repository valgono come modello.
# L'app riconosce di essere stata installata da qui (`/usr/bin`) e lascia gli aggiornamenti a pacman.

pkgname=reasonance-bin
pkgver=1.0.0
pkgrel=2
# Il vecchio Reasonance (TNASRLSB/reasonance) su AUR era arrivato alla 3.2.x: senza `epoch` pacman
# vedrebbe la 1.0.0 come più vecchia e non la proporrebbe mai a chi ha il pacchetto.
epoch=1
pkgdesc='Accessible IDE over agentic CLIs: chat, preview and voice instead of a terminal (prebuilt binary)'
arch=('x86_64')
url='https://github.com/RSNNC/reasonance-build'
# Il progetto non dichiara (ancora) una licenza: senza, valgono tutti i diritti riservati.
license=('LicenseRef-Reasonance')
depends=(
	'webkit2gtk-4.1'
	'gtk3'
	'libsoup3'
	'glib2'
	'cairo'
	'gdk-pixbuf2'
	'dbus'
	'alsa-lib'
	'speech-dispatcher'
	'gcc-libs'
	'glibc'
)
optdepends=('espeak-ng: system voice for read-aloud through speech-dispatcher')
provides=('reasonance')
conflicts=('reasonance')
# Il binario arriva già ridotto all'osso dalla release: niente strip né pacchetto di debug.
options=('!strip' '!debug')
source=("reasonance-${pkgver}-linux-x86_64.tar.gz::https://github.com/RSNNC/reasonance-build/releases/download/v${pkgver}/reasonance-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('c4af5c2a8ec61eaa3ba155be58cb5fcadbf089b10e39c3eaad5dbc5e48a1e5ec')

package() {
	cd "reasonance-${pkgver}-linux-x86_64"
	install -Dm755 reasonance "${pkgdir}/usr/bin/reasonance"
	local sz
	for sz in 32 64 128; do
		install -Dm644 "icons/${sz}x${sz}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/apps/com.reasonance.app.png"
	done
	install -dm755 "${pkgdir}/usr/share/applications"
	cat > "${pkgdir}/usr/share/applications/com.reasonance.app.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Reasonance
Comment=Accessible IDE over agentic CLIs
Comment[it]=IDE accessibile sopra le CLI agentiche
Exec=/usr/bin/reasonance
Icon=com.reasonance.app
Terminal=false
Categories=Development;IDE;
StartupWMClass=Reasonance
EOF
}
