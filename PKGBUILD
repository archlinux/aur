# Maintainer: mitchpk <kphctim at gmail dot com>
# Thanks to https://aur.archlinux.org/packages/factorio/ for authentication code

pkgname=fmodstudio
pkgver=2.02.02
pkgrel=1
pkgdesc="Desktop application for adaptive audio content creation"
arch=('x86_64')
url="https://fmod.com"
license=('custom')
depends=('alsa-lib' 'libxcursor' 'libxcomposite' 'freetype2' 'nss' 'hicolor-icon-theme' 'libxtst')
source=('LICENSE.html')
sha256sums=('f828e794ce468d1aa47f1a4436af9fbf2e95eac0e3051c1eefa44ab1a7c9eab8')
makedepends=('jq')
_filename=fmodstudio20202linux64-installer.deb

build() {
    echo "Downloading FMOD Studio requires an FMOD.com account"
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
                    --data-urlencode path="files/fmodstudio/tool/Linux/" \
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
    echo "Unpacking..."
    ar p "${SRCDEST}/${_filename}" data.tar.xz | tar -C "${pkgdir}" -Jx
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/fmodstudio/fmodstudio "${pkgdir}/usr/bin"
    ln -s /opt/fmodstudio/fmodstudiocl "${pkgdir}/usr/bin"

    install -Dm644 LICENSE.html "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
}
