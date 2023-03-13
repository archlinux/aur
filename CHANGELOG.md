# Changelog
All notable changes in **python-transip** are documented below.

## [Unreleased]

## [0.6.0] (2021-11-01)
### Added
- Python 3.10 support ([#49](https://github.com/roaldnefs/python-transip/pull/49)).

## [0.5.0] (2021-02-10)
### Added
- The option to replace all existing nameservers of a single domain at once from the `transip.v6.objects.Domain.nameservers` service.
- The option to list all colocations from the `transip.TransIP.colocations` service ([#24](https://github.com/roaldnefs/python-transip/issues/24)).
- The option to retrieve a single colocation by name from the `transip.TransIP.colocations` service ([#24](https://github.com/roaldnefs/python-transip/issues/24)).
- The option to allow the access token to be used from all IP-addresses instead of only the whitelisted ones ([#46](https://github.com/roaldnefs/python-transip/issues/46)).

## [0.4.0] (2021-01-24)
### Added
- This `CHANGELOG.md` file to be able to list all notable changes for each version of **python-transip**.
- The `transip.TransIP.api_test` service to allow calling the test resource to make sure everything is working.
- The option to list all invoices attached to your TransIP account from the `transip.TransIP.invoices` service.
- The option to save an invoice as PDF file from `transip.v6.objects.Invoice` object.
- The option to list all products available in TransIP from the `transip.TransIP.products` service.
- The option to update a single SSH key from `transip.v6.objects.SshKey` object.
- The option to update the content of a single DNS record from the `transip.v6.objects.Domain.dns` service, as well as from the `transip.v6.objects.DnsEntry` object.
- The option to replace all existing DNS records of a single domain at once from the `transip.v6.objects.Domain.dns` service.

[Unreleased]: https://github.com/roaldnefs/python-transip/compare/v0.6.0...HEAD
[0.6.0]: https://github.com/roaldnefs/python-transip/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/roaldnefs/python-transip/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/roaldnefs/python-transip/compare/v0.3.0...v0.4.0
