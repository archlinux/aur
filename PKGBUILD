# Maintainer: Marcel Robitaille <mail@marcelrobitaille.me>

pkgname=kiri-git
pkgver=1.2.0.r33.g0a26dd4
pkgrel=1
pkgdesc="A tool for reviewing Schematics and Layouts of Git-versioned Kicad-projects, visually"
url="https://github.com/leoheck/kiri"
license=("MIT")
arch=("x86_64")
provides=("kiri")
conflicts=("kiri")
makedepends=("git" "python-pip")
depends=("python" "patch" "dos2unix" "kicad" "imagemagick" "xdotool" "perl-rename")

source=("kiri::git+https://github.com/leoheck/kiri.git" "git+https://github.com/leoheck/kicad_parser.git" "git+https://github.com/leoheck/KiCad-Diff.git" "git+https://github.com/jnavila/plotkicadsch.git" "git+https://github.com/realthunder/sexp_parser.git")
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP" "SKIP")

prepare() {
	cd kiri
	git submodule init
	git config submodule.kicad_parser.url "$srcdir/kicad_parser"
	git config submodule.KiCad-Diff.url "$srcdir/KiCad-Diff"
	git config submodule.plotkicadsch.url "$srcdir/plotkicadsch"
	git -c protocol.file.allow=always submodule update
	cd submodules/kicad_parser
	git submodule init
	git config submodule.sexp_parser.url "$srcdir/sexp_parser"
	git -c protocol.file.allow=always submodule update
	pip install "pillow>8.2.0" "six>=1.15.0" "dateutils>=0.6.12" "python_dateutil>=2.8.1" "pytz>=2021.1" "pathlib>=1.0.1" "wxpython>=4.0.7" "wxwidgets>=1.0.5"
}

package() {
	mkdir -p "$pkgdir/opt/kiri/"
	mkdir -p "$pkgdir/usr/bin"
	cp -r kiri/* "$pkgdir/opt/kiri"
	for bin in "find_kicad5_sch_hier" "find_kicad6_sch_hier" "fix_svg_vias" "git-imgdiff" "kicad6_sheet_instances" "kicad_rev" "kicad_version" "kicad_version.py" "kicad_version_cliclick" "kicad_version_xdotool" "kiri" "kiri-file-picker" "kiri-server" "plot_kicad_sch" "plot_kicad_sch_macos" "plotgitsch_svg_tweaks"; do
		ln -s "../../opt/kiri/bin/$bin" "$pkgdir/usr/bin/$bin"
	done
}

pkgver() {
	cd "kiri"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
