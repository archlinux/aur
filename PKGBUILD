# Maintainer:  Lisa Riedler <dev@riedler.wien>

# This does the same job as python-leo, but is completely unrelated.
# It grew out of a small bash script inspired by a different bash script `gtrans` which did the same for google translate,
# which is notoriously bad at preserving meaning when translating singular words and phrases.
# Naturally, I just called the binary `leo` and used it locally for a few months until I even realized that somebody else
# already made a CLI tool for leo called the exact same thing. Unfortunately for you, I've already built up muscle memory
# at this point, so I'm unwilling to call the command something else now that I'm making it more public.

_pkgname='python-dictleo'
pkgname="${_pkgname}-git"
epoch=0
pkgver=0.0.0.31_16876e2
pkgrel=1
pkgdesc="Python library and CLI tool for dict.leo.org"
arch=('any')
url='https://codeberg.org/Riedler/python-dictleo'
license=('CC0-1.0')
group=()
depends=(
    'python>=3'
    'python-requests'
)
optdepends=()
makedepends=('git' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "leo-dict-cli" "python-leo")
checkdepends=()
source=(
	"${_pkgname}::git+${url}.git"
	"leo.sh"
)
sha256sums=(
	'SKIP'
	'37ffc19f82bc55a4af62f550cc080e2d94a9e08d7c2e73f6b308ec2c4503bf42'
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	# lasttag=$(git describe --tags "$(git rev-list --tags --max-count=1)")
	# NOTE: ↑ there's no tags yet,
	#       ↓ so we're marking it as 0.0.0.revcount_commithash
	printf "%s.%s_%s" "0.0.0" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	# just manually chuck it in there. what could go wrong
	install -Dm755 '../leo.sh' "$pkgdir/usr/bin/leo"
	pythonversion="$(python3 --version | grep -E '[0-9]\.[0-9]+' --only-matching)" # e.g. "3.13"
	destination="$pkgdir/usr/lib/python${pythonversion}/site-packages/dictleo"
	cd ./src/dictleo/
	find ./ -type f -exec install -D "{}" "$destination/{}" \;
	install -Dm755 '../__main__.py' "$destination/"
}
