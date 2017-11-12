# Maintainer: Andrew Crerar <andrew (at) crerar (dot) io>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Sebastian Stammler <stammler.s@gmail.com>
# Contributor: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Michalis Georgiou <mechmg93@gmail.comr>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname=ttf-google-fonts-git
pkgver=r1211.414832ad
pkgrel=2
epoch=1
pkgdesc="TrueType fonts from the Google Fonts project (git version)"
arch=(any)
url="https://github.com/google/fonts"
license=('custom:SIL Open Font License' 'custom:Ubuntu Font License v1.0')

depends=(fontconfig
         xorg-mkfontdir
         xorg-mkfontscale
         xorg-fonts-encodings
         noto-fonts
         noto-fonts-extra
         ttf-fira-sans
         ttf-fira-mono
         ttf-ubuntu-font-family
         ttf-croscore
         ttf-roboto
         ttf-inconsolata
         cantarell-fonts)
makedepends=(git)
conflicts=(adobe-source-code-pro-fonts adobe-source-sans-pro-fonts jsmath-fonts
           lohit-fonts ttf-andika ttf-anonymous-pro ttf-cardo ttf-comfortaa
           ttf-lato
           ttf-lora-cyrillic ttf-lekton ttf-medievalsharp ttf-merriweather
           ttf-merriweather-sans ttf-nova ttf-opensans ttf-oswald ttf-oxygen
           ttf-oxygen-git ttf-pt-fonts ttf-quintessential ttf-roboto-mono
           ttf-signika ttf-sil-fonts ttf-source-code-pro-ibx ttf-source-sans-pro-ibx ttf-vollkorn-ibx ttf-arabeyes-fonts)
provides=(adobe-source-code-pro-fonts adobe-source-sans-pro-fonts jsmath-fonts
          lohit-fonts ttf-andika ttf-anonymous-pro ttf-cardo ttf-comfortaa
          ttf-lato
          ttf-lora-cyrillic ttf-lekton ttf-medievalsharp ttf-merriweather
          ttf-merriweather-sans ttf-nova ttf-opensans ttf-oswald ttf-oxygen
          ttf-oxygen-git ttf-pt-fonts ttf-quintessential ttf-roboto-mono
          ttf-signika ttf-sil-fonts ttf-source-code-pro-ibx ttf-source-sans-pro-ibx ttf-vollkorn-ibx)
source=(git+"${url}".git)
sha512sums=('SKIP')

pkgver() {
  cd fonts

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # NOTE: These are the font families that already exist in the [extra] and [community] repos.
  declare -A omitted_font_families=([cantarell]=1 [noto-sans-tamil]=1 [noto-serif]=1
                                    [noto-sans]=1 [fira-sans]=1 [fira-mono]=1
                                    [ubuntu]=1 [ubuntu-mono]=1 [tinos]=1 [arimo]=1
                                    [cousine]=1 [roboto]=1 [roboto-condensed]=1
                                    [inconsolata]=1)

  while IFS= read -rd '' file; do
    font_family=$(fc-query -f '%{family[0]|downcase|translate( ,-)}\n' "$file" | sed -n '2p')

    # NOTE: Skip the rest of the loop if we're not supposed to be touching this family
    ((omitted_font_families["$font_family"])) && continue

    pkg_font_path="$pkgdir"/usr/share/fonts/"$font_family"
    install -dm755 "$pkg_font_path" # Create the folder for the font (if it doesn't exist yet)
    install -Dm644 "$file" -t "$pkg_font_path" # Install the font in the folder

    # NOTE: If the font's license path already exists, we don't need to copy the license into it again.
    pkg_license_path="$pkgdir"/usr/share/licenses/"$pkgname"/"$font_family"
    [[ -d "$pkg_license_path" ]] && continue

    # NOTE: We only care about copying over OFL licenses since Apache and Ubuntu are standard.
    IFS=\/ read -ra path <<< "$file"; src_license_path="${srcdir}$(printf "/%s" "${path[@]:1:3}")"/OFL.txt
    if [[ -f "$src_license_path" ]]; then
      install -dm755 "$pkg_license_path"
      install -Dm644 "$src_license_path" "$pkg_license_path"/OFL.txt
    fi
  done < <(find . -type f -iname \*.ttf -print0)

  # NOTE: Since the cwtex* Chinese font family has special characters we need to change
  # those folder names to prevent errors during package compression.
  mv "$pkgdir"/usr/share/fonts/cwtex-仿宋體 "$pkgdir"/usr/share/fonts/cwtex-fangsong
  mv "$pkgdir"/usr/share/licenses/"$pkgname"/cwtex-仿宋體 "$pkgdir"/usr/share/licenses/"$pkgname"/cwtex-fangsong

  mv "$pkgdir"/usr/share/fonts/cwtex-楷書 "$pkgdir"/usr/share/fonts/cwtex-kai
  mv "$pkgdir"/usr/share/licenses/"$pkgname"/cwtex-楷書 "$pkgdir"/usr/share/licenses/"$pkgname"/cwtex-kai

  mv "$pkgdir"/usr/share/fonts/cwtex-明體 "$pkgdir"/usr/share/fonts/cwtex-ming
  mv "$pkgdir"/usr/share/licenses/"$pkgname"/cwtex-明體 "$pkgdir"/usr/share/licenses/"$pkgname"/cwtex-ming

  mv "$pkgdir"/usr/share/fonts/cwtex-圓體 "$pkgdir"/usr/share/fonts/cwtex-yen
  mv "$pkgdir"/usr/share/licenses/"$pkgname"/cwtex-圓體 "$pkgdir"/usr/share/licenses/"$pkgname"/cwtex-yen
}
