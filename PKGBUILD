# Maintainer: JOLIMAITRE Matthieu <matthieu@imagevo.fr>
pkgname="velus-git"
pkgver=3.0.0
pkgrel=1
pkgdesc="The Velus Lustre compiler."
url="https://github.com/INRIA/velus"
arch=("x86_64")
license=("Inria Non-Commercial License Agreement")
makedepends=()
optdepends=()
depends=('opam' 'git' 'make' 'ocamlbuild' 'coreutils')
source=("https://github.com/INRIA/velus/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("f61ea2b36acf83759aa10b3a2c11696b912b9926a44862c5d678e46f3ac3602d")

build() {
	# install sources
	cd "$srcdir/velus-3.0.0"
	rm -fr CompCert
	git clone https://github.com/inria-parkas/CompCert.git CompCert
	( cd CompCert && git checkout e19f81cecf4a7cca67d8491fcb4c0a259c232bfb )

	VELUS_DIR="$PWD"
	export TMP="$PWD/opam_workdir"
	export TMPDIR="$PWD/opam_workdir"
	JOBS=$(nproc)

	# setup opam
	rm -fr   opam opam_workdir
	mkdir -p opam opam_workdir
	opam init --jobs=$JOBS --root=opam --compiler=4.07.1 --no
	eval $(opam config env --root=$VELUS_DIR/opam --set-root)

	# install opam build deps
	opam repo add coq-released https://coq.inria.fr/opam/released
	opam install --jobs=$JOBS --yes coq.8.9.1 menhir.20200624 coq-menhirlib.20200624

	# run actual build process
	./configure x86_64-linux
	make --jobs=$JOBS
}

package() {
	cd "$srcdir/velus-3.0.0/_build"
	install -D      src/veluslib.o                    "$pkgdir/usr/share/velus/veluslib.o"
	install -D      src/veluslib.cmo                  "$pkgdir/usr/share/velus/veluslib.cmo"
	install -D      src/veluscommon.cmo               "$pkgdir/usr/share/velus/veluscommon.cmo"
	install -D      src/velusmain.cmi                 "$pkgdir/usr/share/velus/velusmain.cmi"
	install -D      src/velusmain.ml.depends          "$pkgdir/usr/share/velus/velusmain.ml.depends"
	install -D      src/veluscommon.ml.depends        "$pkgdir/usr/share/velus/veluscommon.ml.depends"
	install -D      src/compcert.ini                  "$pkgdir/usr/share/velus/compcert.ini"
	install -D      src/veluslib.cmx                  "$pkgdir/usr/share/velus/veluslib.cmx"
	install -D      src/veluscommon.cmi               "$pkgdir/usr/share/velus/veluscommon.cmi"
	install -D      src/velusmain.ml                  "$pkgdir/usr/share/velus/velusmain.ml"
	install -D      src/veluslib.ml                   "$pkgdir/usr/share/velus/veluslib.ml"
	install -D      src/veluslib.ml.depends           "$pkgdir/usr/share/velus/veluslib.ml.depends"
	install -D      src/velusmain.cmo                 "$pkgdir/usr/share/velus/velusmain.cmo"
	install -D      src/veluscommon.cmx               "$pkgdir/usr/share/velus/veluscommon.cmx"
	install -D      src/veluslib.cmi                  "$pkgdir/usr/share/velus/veluslib.cmi"
	install -D      src/veluscommon.o                 "$pkgdir/usr/share/velus/veluscommon.o"
	install -D      src/veluscommon.ml                "$pkgdir/usr/share/velus/veluscommon.ml"
	install -D      src/velusmain.o                   "$pkgdir/usr/share/velus/velusmain.o"
	install -D      src/velusmain.cmx                 "$pkgdir/usr/share/velus/velusmain.cmx"
	install -Dm 755 src/velusmain.native              "$pkgdir/usr/share/velus/velusmain.native"
	mkdir -p                                          "$pkgdir/usr/bin"
	ln -s           /usr/share/velus/velusmain.native "$pkgdir/usr/bin/velus"
}
