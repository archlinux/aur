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
