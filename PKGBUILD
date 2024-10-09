# Maintainer:  Rikka_Neko <yjzyl9008@gmail.com>
# Thanks to https://aur.archlinux.org/packages/factorio/ for authentication code

pkgname=fmodengine
pkgver=2.02.24
pkgrel=1
pkgdesc="FMOD Engine API and tools"
arch=('x86_64')
url="https://www.fmod.com/"
license=('custom')
depends=('glibc')
_filename=fmodstudioapi$(echo "${pkgver}" | sed 's/\.//g')linux.tar.gz

build() {
    echo "Downloading FMOD Engine requires an FMOD.com account"
    local file="${SRCDEST}/${_filename}"
    local username=$FMOD_LOGIN
    local password=$FMOD_PASSWORD
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
                    --data-urlencode filename="$_filename" \
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
    install -d "${pkgdir}/opt/$pkgname"
    tar -xzf "${SRCDEST}/${_filename}" -C "${pkgdir}/opt/$pkgname" --strip-components=1
    
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/$pkgname/bin/fmodprofiler" "${pkgdir}/usr/bin/fmodprofiler"
    ln -s "/opt/$pkgname/bin/fsbank" "${pkgdir}/usr/bin/fsbank"
    ln -s "/opt/$pkgname/bin/fsbank_gui" "${pkgdir}/usr/bin/fsbank_gui"

    install -d "${pkgdir}/usr/lib/$pkgname"
    ln -s "/opt/$pkgname/api/core/lib/${arch}"/*.so "${pkgdir}/usr/lib/$pkgname"
    ln -s "/opt/$pkgname/api/fsbank/lib/${arch}"/*.so "${pkgdir}/usr/lib/$pkgname"
    ln -s "/opt/$pkgname/api/studio/lib/${arch}"/*.so "${pkgdir}/usr/lib/$pkgname"
}
