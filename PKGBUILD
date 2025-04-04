# Maintainer:  Rikka_Neko <yjzyl9008@gmail.com>
# Thanks to https://aur.archlinux.org/packages/factorio/ for authentication code

pkgname=fmodengine
pkgver=2.03.07
pkgrel=1
pkgdesc="FMOD Engine API and tools - Audio engine and toolset for games."
arch=('x86_64')
url="https://www.fmod.com/"
license=('custom')
makedepends=('jq'
             'patchelf')
depends=('glibc')
options=('!strip')
_filename="fmodstudioapi${pkgver//./}linux.tar.gz"
_sha256="d807076c3fb630752410f4b5f1a75b943c43af1ce09ea06d6773ddb7be315e3c"
source=('LICENSE.html')
sha256sums=('6288db3085c1d1dbefaa3a4c93cd0e8f5a3f589849cc6f5b8812c80fafac474c')
noextract=("$_filename")

build() {
    local file="${SRCDEST}/${_filename}"
    local sha256="$(sha256sum "$file" 2>/dev/null | awk '{print $1}')" || true
    # Only use _sha256 to skip re-downloading, not used in general as an integrity check.
    if test "$sha256" = "${_sha256:-}" ; then return 0 ; fi

    echo "Downloading FMOD Engine requires an FMOD.com account"
    local username="${FMOD_LOGIN:-}"
    local password="${FMOD_PASSWORD:-}"
    local token
    local completed=0

    while [[ $completed -eq 0 ]]; do
        if [[ -z $username || -z $password ]]; then					
            [[ ! -t 0 ]] && return 1
            echo "Please enter your username/email and password"
            read -rp "Username or email: " username
            [[ -z $username ]] && continue

            read -rsp "Password: " password; echo
            [[ -z $password ]] && continue
        fi

        echo "Logging in..."

        local output
        if output=$(curl --silent -X POST https://fmod.com/api-login --user $username:$password
            ) && token=$(echo "$output" | jq -r '.token | strings') && [[ -n $token ]]
        then
            echo "Successfully authenticated with token"
        else
            echo "Login failed"

            [[ ! -t 0 ]] && return 1
            read -n1 -p "Retry login? (Y/n) " try_again ; echo
            if [[ "${try_again,,*}" == "n" ]]; then
                return 1
            else
                continue
            fi
        fi	

        echo "Downloading $_filename..."
        if output=$(curl -G "https://fmod.com/api-get-download-link" \
                    --data-urlencode path="files/fmodstudio/api/Linux/" \
                    --data-urlencode filename="$(basename "$file")" \
                    -H "Authorization: FMOD $token") &&
                    downloadurl=$(echo "$output" | jq -r '.url | strings') && [[ -n $downloadurl ]]
        then
            code=$(curl -G --retry 10 --retry-delay 3 \
                 --fail --location \
                 --continue-at - \
                 --output "${file}.part" \
                 "$downloadurl" \
                 --write-out '%{http_code}'
            ) || rm -f "${file}.part"

            if [[ ! -f "${file}.part" ]]; then
                echo "Download failed"
                return 1
            fi

            echo "Download successful"
            mv "${file}"{.part,}
            completed=1
        else
            echo "Failed to fetch download link"
            return 1
        fi
    done
}

package() {
    cd "$srcdir"
    tar -xzf "${SRCDEST}/${_filename}"
    
    local e
    for e in "$srcdir/fmodstudioapi${pkgver//./}linux/bin/"{fmodprofiler,fsbank,fsbank_gui} ; do
        patchelf --add-rpath /usr/lib/fmodengine "$e"
        chmod 0755 "$e"
    done
    
    install -d "${pkgdir}/opt/$pkgname"
    cp -r "fmodstudioapi${pkgver//./}linux/"* "${pkgdir}/opt/$pkgname/"
    
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/$pkgname/bin/fmodprofiler" "${pkgdir}/usr/bin/fmodprofiler"
    ln -s "/opt/$pkgname/bin/fsbank" "${pkgdir}/usr/bin/fsbank"
    ln -s "/opt/$pkgname/bin/fsbank_gui" "${pkgdir}/usr/bin/fsbank_gui"

    install -d "${pkgdir}/usr/lib/$pkgname"
    local i d
    for d in core fsbank studio ; do
        for i in "$pkgdir/opt/$pkgname/api/$d/lib/$CARCH/"*.so ; do
            ln -s "/opt/$pkgname/api/$d/lib/$CARCH/$(basename "$i")" "$pkgdir/usr/lib/$pkgname"
        done
    done

    install -Dm0644 LICENSE.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}