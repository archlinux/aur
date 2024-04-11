# Maintainer: Unknown Packager

export PIP_CONFIG_FILE=/dev/null
export PIP_DISABLE_PIP_VERSION_CHECK=true

pkgname=python-dagger-io
pkgver=0.11.0
pkgrel=00
pkgdesc='A client package for running Dagger pipelines in Python.'
arch=(any)
url=https://pypi.org/project/dagger-io/
license=('Apache-2.0')
depends=(
	dagger
	python
	python-anyio
	python-beartype
	python-cattrs
	python-gql
	python-graphql-core
	python-platformdirs
	python-rich
	python-typing_extensions
)
makedepends=(
	python-pip
	)
checkdepends=(
	python-aiohttp
	python-aiosignal
	python-anyio
	python-attrs
	python-certifi
	python-frozenlist
	python-h11
	python-httpcore
	python-httpx
	python-idna
	python-iniconfig
	python-multidict
	python-packaging
	python-pluggy
	python-pytest
	python-pytest-httpx
	python-pytest-lazy-fixture
	python-pytest-mock
	python-sniffio
	#python-subprocess
	python-yarl
	)
source=(
	"https://github.com/dagger/dagger/archive/refs/tags/sdk/python/v${pkgver}.tar.gz"
	)
sha256sums=(
	"23d17b6e3bced60aa6939a36609c8d73d28040afeeba0cadac7b1038695d607b"
	)

_dist_name="dagger-sdk-python-v${pkgver}"
_skd_dir="${_dist_name}/sdk/python"

check() {
	cd "${srcdir}/${_skd_dir}"
	dagger call -m dev tests
}

build() {
	cd "${srcdir}/${_skd_dir}"

	# Use the latest version of pip, as Arch's version is historically out of
	# date(!) and newer versions do fix bugs (sometimes).
	python -mvenv --clear --system-site-packages _tmpenv
	_tmpenv/bin/pip --quiet install -U pip

	# Build the wheel (which we allow to fail) only after fetching the license.
	# In order to isolate from ~/.pydistutils.cfg, we need to set $HOME to a
	# temporary directory, and thus first $XDG_CACHE_HOME back to its real
	# location, so that pip inserts the wheel in the wheel cache.  We cannot
	# use --global-option=--no-user-cfg instead because that fully disables
	# wheels, causing a from-source build of build dependencies such as
	# numpy/scipy.
	XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}" HOME=_tmpenv \
		_tmpenv/bin/pip wheel \
		--verbose \
		--no-deps \
		--wheel-dir="${srcdir}" \
		"."
}

package() {
	cd "${srcdir}/${_skd_dir}"

	# pypa/pip#3063: pip always checks for a globally installed version.
	python -mvenv --clear --system-site-packages _tmpenv
	_tmpenv/bin/pip install \
		--prefix="${pkgdir}/usr" \
		--no-deps \
		--ignore-installed \
		--no-warn-script-location \
		"$(ls "${srcdir}"/*.whl 2>/dev/null)"

	if [[ -d "${pkgdir}/usr/bin" ]]; then  # Fix entry points.
		for f in "${pkgdir}/usr/bin/"*; do
			if [[ $(head -n1 "$f") = "#!$(readlink -f _tmpenv)/bin/python" ]]; then
				sed -i '1c#!/usr/bin/python' "$f"
			fi
		done
	fi
	if [[ -d "${pkgdir}/usr/etc" ]]; then
		mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
	fi

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
