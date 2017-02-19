# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

# Due to the license's distribution condition,
# you need to download the archive below and put it in PKGBUILD directory.
# https://drive.google.com/file/d/0B2NEzl-56UFHd054VnJETzJOZjg/view?usp=sharing
# For latest versions, see <http://midkar.com/soundfonts/> and inform the AUR package maintainer.

pkgname=soundfont-toh
pkgver=3.4
_relstage="Final"
pkgrel=1
pkgdesc="Don Allen's Timbres of Heaven soundfont"
arch=('any')
url="http://midkar.com/soundfonts/"
license=('custom')
source=('LICENSE')
md5sums=('d16e886620799516141446e3bd06050b')

_local_src=("Timbres Of Heaven GM_GS_XG_SFX V ${pkgver[0]} $_relstage.7z")
_local_md5sums=('a2a2f85380f0e5eb5b06635306fbc8a9')

prepare() {
	cd "${srcdir%/*}/"
	msg "$(gettext "Validating source files with %s...")" "md5sums"
	local md5_cnt=0 file errors=0
	for file in "${_local_src[@]}"; do
		if [[ -s "$file" ]]; then
			printf '    %s ... ' "$file" >&2
			if [[ "${_local_md5sums["$md5_cnt"]}" == "`md5sum "$file" | awk '{ print $1 }'`" ]]; then
				printf '%s\n' "$(gettext "Passed")" >&2
			else
				printf '%s\n' "$(gettext "FAILED")" >&2 || errors=1
			fi
			md5_cnt=$[md5_cnt+1]
		else
			error "$(gettext "Unable to find source file %s.")" "$file"
			return 1
		fi
	done
	if (( errors )); then
		error "$(gettext "One or more files did not pass the validity check!")"
		return 1
	fi

	# Extracting package
	msg "$(gettext "Extracting sources...")"
	bsdtar -xf "$_local_src" -C "$srcdir/"
}

package() {
  install -Dm0644 "$srcdir/${_local_src%.*}.sf2" "$pkgdir/usr/share/soundfonts/${_local_src%.*}.sf2"
  install -Dm0644 "$srcdir/${_local_src%.*}.txt" "$pkgdir/usr/share/doc/${pkgname}/${_local_src%.*}.txt"
  install -Dm0644 "$srcdir/Timbres_of_Heaven.mlb" "$pkgdir/usr/share/doc/${pkgname}/Timbres_of_Heaven.mlb"
  install -Dm0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
