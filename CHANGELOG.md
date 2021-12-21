## 11.3.1 (2021-12-08)

## What's Changed
* Log request using zap by @boekkooi-lengoo in https://github.com/jhaals/yopass/pull/1130

* build(deps): bump react-router-dom from 5.3.0 to 6.0.2 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1129
* build(deps-dev): bump @types/react-dom from 17.0.10 to 17.0.11 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1122
* build(deps-dev): bump eslint-plugin-import from 2.25.2 to 2.25.3 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1139
* build(deps): bump react-i18next from 11.13.0 to 11.14.2 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1138
* build(deps-dev): bump @types/node from 16.11.6 to 16.11.7 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1137
* build(deps): bump @emotion/react from 11.5.0 to 11.6.0 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1134
* build(deps): bump i18next from 21.4.0 to 21.4.2 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1132
* build(deps): bump @emotion/styled from 11.3.0 to 11.6.0 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1141
* build(deps-dev): bump cypress from 8.7.0 to 9.0.0 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1136
* build(deps): bump @mui/styles from 5.0.2 to 5.1.1 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1143
* build(deps): bump openpgp from 5.0.0 to 5.0.1 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1151
* build(deps-dev): bump @types/react from 17.0.34 to 17.0.36 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1149
* build(deps-dev): bump @types/node from 16.11.7 to 16.11.9 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1148
* build(deps-dev): bump @types/file-saver from 2.0.3 to 2.0.4 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1145
* build(deps-dev): bump @types/jest from 27.0.2 to 27.0.3 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1147
* build(deps): bump i18next from 21.4.2 to 21.5.2 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1146
* build(deps-dev): bump @types/node from 16.11.9 to 16.11.10 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1161
* build(deps): bump @emotion/react from 11.6.0 to 11.7.0 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1160
* build(deps-dev): bump cypress from 9.0.0 to 9.1.0 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1163
* build(deps): bump i18next from 21.5.2 to 21.5.3 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1164
* build(deps-dev): bump prettier from 2.4.1 to 2.5.0 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1165
* build(deps): bump @mui/styles from 5.1.1 to 5.2.1 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1162
* build(deps): bump react-i18next from 11.14.2 to 11.14.3 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1169
* build(deps-dev): bump @types/react from 17.0.36 to 17.0.37 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1158
* build(deps): bump github.com/gofrs/uuid from 4.1.0+incompatible to 4.2.0+incompatible by @dependabot in https://github.com/jhaals/yopass/pull/1156
* build(deps-dev): bump cypress from 9.1.0 to 9.1.1 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1175
* build(deps): bump swr from 1.0.1 to 1.1.0 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1174
* build(deps-dev): bump prettier from 2.5.0 to 2.5.1 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1173
* build(deps-dev): bump @types/node from 16.11.10 to 16.11.11 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1171
* build(deps): bump @mui/styles from 5.1.1 to 5.2.2 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1170
* build(deps): bump i18next from 21.5.2 to 21.5.4 in /website by @dependabot in https://github.com/jhaals/yopass/pull/1166


**Full Changelog**: https://github.com/jhaals/yopass/compare/11.3.0...11.3.1

## 11.2.0 (2021-09-16)

Notable changes:

- Disable grammarly extenion and spellcheck attribute on textfield
- improve internationalization #1037

## 11.1.2 (2021-03-11)

#812 Fixes bug where secret would be downloaded from the browser twice.

## 11.1.1 (2021-03-08)

Fixes issue where rendering fails in Firefox private mode due to the fact that the serviceWorker API is not available.

#802 Update yopass cli to use the new consolidated URLs

## 11.1.0 (2021-03-07)

Add logic that unregisters old service workers added by Create React App template. Fixes #787

## 11.0.0 (2021-03-04)

* This release adds support for retrying decryption with a different password for the already downloaded payload.
* Encrypted content with a custom password no longer generate a url that indicates that a custom password is used.
* Various UI tweaks for the new material UI design, please note that this is still in progress and if you've got design skills, please help out!

## 10.2.0 (2021-01-31)

* New UI framework: Bootstrap/Reactstrap has been switched out for the more modern MaterialUI, big thanks to @jesperorb doing this in #703.
* Fix: Make frontend work with non root URL #732

## 10.1.0 (2020-11-14)

* #671 Don't hang if no file or stdin provided. Thanks @arbovm for improving the CLI experience.
* #664 Add force-onetime-secrets option. Run yopass-server with --force-onetime-secrets=true enforce that all stored secrets are one time downloads only.

## 10.0.0 (2020-10-02)

Yopass CLI support was added: <https://github.com/jhaals/yopass/pull/580>.
Yopass have had several CLIs for creating secrets over the years but this is the first official which is hosted in the same repository.

Binaries have changed slightly so yopass is now the CLI and yopass-server will run the regular server.
There won't be a difference for those running yopass in Docker since the entrypoint will remain the same.

## 9.0.0 (2020-09-03)

* #573 Add file upload to the navigation bar file_cabinet
  File sizes are very restrictive at this point due to the fact that encryption/decryption is made in the browser and that the storage is memory. Use this feature for certificate/keys and other things where you need to quickly drag and drop.

* #550 Set Common Security Headers.
  Big thanks to @grobie!

* #566 Added the option to manually set a decryption key for secrets.
  Thanks @jfenske89!
