# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=red-discordbot
pkgname="${_pkgname}-git"
pkgver=3.4.5.r25.g7630e2482
pkgrel=2
pkgdesc="Red - A fully customizable Discord bot"
arch=(any)
url="https://github.com/Cog-Creators/Red-DiscordBot"
license=('GPL')
depends=('python' 'python-setuptools' 'python-aiohttp' 'python-aiohttp-json-rpc' 'python-aiosqlite'
         'python-appdirs' 'python-apsw' 'python-async-timeout' 'python-attrs' 'python-babel'
         'python-chardet' 'python-click' 'python-colorama' 'python-contextlib2' 'python-discord'
         'python-distro' 'python-fuzzywuzzy' 'python-idna' 'python-markdown' 'python-multidict'
         'python-levenshtein' 'python-pytz' 'python-yaml' 'python-red-lavalink' 'python-schema'
         'python-tqdm' 'python-typing_extensions' 'python-uvloop' 'python-yarl' 'python-pip'
         'python-rich')
makedepends=('git')
checkdepends=('python-astroid' 'python-iniconfig' 'python-isort' 'python-lazy-object-proxy' 'python-mccabe'
              'python-more-itertools' 'python-packaging' 'python-pluggy' 'python-py' 'python-pylint' 'python-pyparsing'
              'python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-six' 'python-toml' 'python-wrapt')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("${_pkgname}::git+$url"
        "config_paths.patch"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles"
        "${_pkgname}@.service")
sha256sums=('SKIP'
            '0cd709fe49761f47c77b2202ec7d11ae8e7cd5a3b93db5a3249d69ed81b5b49b'
            'c6e35e526e63c26e9f183cd37fdfeea10a7ebcc3ea13edd6fbbad51936897158'
            '62b30643e8e746b0cb07fea332aee6f33d8fcc2fccdbca8645176f175247cae1'
            '01b1c7827328d8940c37d240367ab72efdc346596305cb21cb6d2cba12a59391')

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"

	# levenshtein-wheels 0.13.1 is the same as levenshtein 0.12.0, but with wheels
	# unpin all dependencies, since they don't usually match up with Arch's packages
	# replace -wheels packages with their normal counterparts
	sed --in-place --regexp-extended \
		-e 's/(python-Levenshtein-wheels)==0.13.1/\1==0.12.0/' \
		-e 's/==/>=/' \
		-e 's/-wheels//' \
		setup.cfg
	patch -p1 < "$srcdir/config_paths.patch"
}

build() {
	cd "$_pkgname"

	python setup.py build
}

check() {
	cd "$_pkgname"

	# tests use fixtures from redbot.pytest, which makes them available
	# with the "pytest11" entry point when installed - but since we're not
	# installing it, we need to patch conftest.py to include them manually
	cp tests/conftest.py{,.orig}
	echo 'pytest_plugins = "redbot.pytest"' >> tests/conftest.py

	PYTHONPATH=. pytest

	mv tests/conftest.py{.orig,}
}

package() {
	cd "$_pkgname"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
	install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
	install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}/${_pkgname}@.service"
}
