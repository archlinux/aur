# Maintainer: Vladimir <racerkafa@gmail.com>

pkgname=finkeeper24-bin
pkgver=2.2.2
pkgrel=1
pkgdesc="FinKeeper24 - менеджер личных финансов (Personal Finance Manager)"
arch=('x86_64')
url="https://finkeeper24.ru"
license=('Apache-2.0')
# Графические зависимости (Arch-аналоги Depends из .deb).
# Java не нужна — в пакете свой встроенный JRE 17 (сборка через jpackage).
depends=('alsa-lib' 'brotli' 'libbsd' 'bzip2' 'glibc' 'expat' 'fontconfig'
         'freetype2' 'libglvnd' 'libmd' 'libpng' 'libx11' 'libxau' 'libxcb'
         'libxdmcp' 'libxext' 'libxi' 'libxrender' 'libxtst' 'xdg-utils' 'zlib')
provides=('finkeeper24')
conflicts=('finkeeper24')
# Не трогаем готовые бинарники апстрима
options=('!strip')
source=("finkeeper24-${pkgver}.deb::https://finkeeper24.ru/downloads/linux/finkeeper24_${pkgver}_amd64.deb"
        "LICENSE-Apache-2.0::https://www.apache.org/licenses/LICENSE-2.0.txt")
sha256sums=('a886b2ea2247cbd5fcb9d1a0f0ce92f268d8f7d4c64b86cb96aae595afabb0f8'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')

package() {
	# Содержимое .deb (makepkg уже распаковал data.tar.* (любое сжатие) в srcdir)
	bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}/"

	# Ярлык в меню (свой, с нормальной категорией — в апстримном стоит Unknown)
	install -d "${pkgdir}/usr/share/applications"
	cat > "${pkgdir}/usr/share/applications/finkeeper24.desktop" <<'EOF'
[Desktop Entry]
Name=FinKeeper24
Comment=Менеджер личных финансов
Exec=/opt/finkeeper24/bin/FinKeeper24
Icon=/opt/finkeeper24/lib/FinKeeper24.png
Terminal=false
Type=Application
Categories=Office;Finance;
# App ID, который окно Compose Desktop репортит на Wayland (= имя главного класса
# ru.homebudget.finkeeper.MainKt). Должен совпадать с ним, иначе Dock (Niri/DMS)
# не сопоставит окно с .desktop → дефолтная иконка и кривое имя.
StartupWMClass=ru-homebudget-finkeeper-MainKt
EOF

	# Запуск командой finkeeper24
	install -d "${pkgdir}/usr/bin"
	ln -s /opt/finkeeper24/bin/FinKeeper24 "${pkgdir}/usr/bin/finkeeper24"

	# Лицензия
	install -Dm644 "${srcdir}/LICENSE-Apache-2.0" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
