# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

# Keep this in sync with the [v8] entry in Frida's releng/deps.toml.
_v8_version='10.9.42'
_commit='a07af892420dfd873b33bd4ce4ba9d963072e1b9'
_commit_timestamp='20260120.192353'

pkgname='frida-v8'
pkgver="${_v8_version}.r${_commit_timestamp}.${_commit:0:8}"
pkgrel=1
pkgdesc="Frida's fork of the V8 JavaScript engine"
arch=('x86_64')
url='https://github.com/frida/v8'
license=(
	'BSD-3-Clause'
	'Apache-2.0'
	'CC0-1.0'
	'MIT'
	'PSF-2.0'
	'LicenseRef-fdlibm'
	'LicenseRef-Valgrind'
)
options=('!lto')
depends=('zlib')
makedepends=(
	'meson'
	'ninja'
	'python'
)

source=(
	"${pkgname}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz"
	'gcc16-algorithm.patch'
	'LICENSE.chromium::https://raw.githubusercontent.com/chromium/chromium/12884f6987a0d766f8bea1018980f434a89c12e1/LICENSE'
)
b2sums=(
	'c8917bd0643b4b22c95e57c0eb411f048ab7630a92ed54c3bd97244b31e42bc56b68766ac34ce1b77152b15c4da7195cc9e093252c3a1a0ef679a88a437ff3c8'
	'b12192f399a09598a6c49cf82dae81bdce62f9e621233eda650ce585fc84998dca05444926e6749c65d12386ac06240bed1e886c107ade4ba0f2032087b4d729'
	'7c1bc3ed9883252f17021cf2b4a5dbdf92f3e33590f65f0b2d910d4218d40b6813a29db72d593d1d6fb95c82735cc7a1b9840247698a3a3d36568aea9e6b8891'
)

_makepkg_jobs() {
	local _arg
	local _jobs=''
	local _jobs_next=0

	for _arg in ${MAKEFLAGS:-}; do
		if (( _jobs_next == 1 )); then
			case "${_arg}" in
				''|*[!0-9]*) ;;
				*) _jobs="${_arg}" ;;
			esac
			_jobs_next=0
			continue
		fi

		case "${_arg}" in
			-j|--jobs)
				_jobs_next=1
				;;
			-j[0-9]*)
				_jobs="${_arg#-j}"
				;;
			--jobs=[0-9]*)
				_jobs="${_arg#--jobs=}"
				;;
		esac
	done

	printf '%s\n' "${_jobs:-1}"
}

prepare() {
	local _source_version

	cd -- "v8-${_commit}" || return 1
	_source_version="$(
		awk '
			/^#define V8_MAJOR_VERSION / { major = $3 }
			/^#define V8_MINOR_VERSION / { minor = $3 }
			/^#define V8_BUILD_NUMBER / { build = $3 }
			END { printf "%s.%s.%s", major, minor, build }
		' include/v8-version.h
	)"
	if [[ "${_source_version}" != "${_v8_version}" ]]; then
		printf 'V8 source version %s does not match PKGBUILD version %s\n' \
			"${_source_version:-<missing>}" "${_v8_version}" >&2
		return 1
	fi
	patch -Np1 --fuzz=0 -i "${srcdir}/gcc16-algorithm.patch"
}

build() {
	local _ninja_flags=()

	meson setup \
		--prefix=/usr \
		--libdir=lib \
		--wrap-mode=nofallback \
		-Ddefault_library=static \
		-Doptimization=s \
		-Db_ndebug=true \
		-Ddebug=false \
		-Dembedder_string=-frida \
		-Dsnapshot_compression=disabled \
		-Dpointer_compression=disabled \
		-Dshared_ro_heap=disabled \
		-Dcppgc_caged_heap=disabled \
		build \
		"v8-${_commit}"

	if [[ -n "${NINJAFLAGS:-}" ]]; then
		read -r -a _ninja_flags <<< "${NINJAFLAGS}"
	else
		_ninja_flags=(-j "$(_makepkg_jobs)")
	fi
	ninja "${_ninja_flags[@]}" -C build
}

package() {
	local _licensedir="${pkgdir}/usr/share/licenses/${pkgname}"

	DESTDIR="${pkgdir}" meson install -C build --no-rebuild

	install -Dm644 -- "v8-${_commit}/LICENSE" "${_licensedir}/LICENSE"
	install -Dm644 -- "v8-${_commit}/LICENSE.v8" "${_licensedir}/LICENSE.v8"
	install -Dm644 -- "v8-${_commit}/LICENSE.fdlibm" "${_licensedir}/LICENSE.fdlibm"
	install -Dm644 -- "v8-${_commit}/LICENSE.strongtalk" "${_licensedir}/LICENSE.strongtalk"
	install -Dm644 -- "v8-${_commit}/third_party/inspector_protocol/LICENSE" "${_licensedir}/LICENSE.inspector-protocol"
	install -Dm644 -- "v8-${_commit}/third_party/wasm-api/LICENSE" "${_licensedir}/LICENSE.wasm-api"
	install -Dm644 -- "v8-${_commit}/src/third_party/siphash/LICENSE" "${_licensedir}/LICENSE.siphash"
	install -Dm644 -- "v8-${_commit}/src/third_party/utf8-decoder/LICENSE" "${_licensedir}/LICENSE.utf8-decoder"
	install -Dm644 -- "v8-${_commit}/src/third_party/valgrind/LICENSE" "${_licensedir}/LICENSE.valgrind"
	install -Dm644 -- "v8-${_commit}/third_party/v8/builtins/LICENSE" "${_licensedir}/LICENSE.python"
	sed -E 's#^// ?##' "${srcdir}/LICENSE.chromium" > "${_licensedir}/LICENSE.chromium"
	chmod 644 -- "${_licensedir}/LICENSE.chromium"

	install -d -- "${pkgdir}/usr/share/${pkgname}"
	printf '%s\n' "${_commit}" > "${pkgdir}/usr/share/${pkgname}/commit"
	printf '%s\n' "${license[@]}" > "${pkgdir}/usr/share/${pkgname}/licenses"
}
