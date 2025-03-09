# Confluent's Python client for Apache Kafka

## v2.8.2

v2.8.1 is a maintenance release with the following fixes and enhancements:

 - Fixed caching to ensure cached schema matches input. (#1922)
 - Fix handling of named Avro schemas (#1928)

confluent-kafka-python v2.8.2 is based on librdkafka v2.8.0, see the
[librdkafka release notes](https://github.com/confluentinc/librdkafka/releases/tag/v2.8.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.

Note: Versioning is skipped due to breaking change in v2.8.1. 
Do not run software with v2.8.1 installed.


## v2.8.0

v2.8.0 is a feature release with the features, fixes and enhancements:

confluent-kafka-python v2.8.0 is based on librdkafka v2.8.0, see the
[librdkafka release notes](https://github.com/confluentinc/librdkafka/releases/tag/v2.8.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v2.7.0

v2.7.0 is a feature release with the features, fixes and enhancements present in v2.6.2 including the following fix:

- Added missing dependency on googleapis-common-protos when using protobufs. (#1881, @tenzer)

confluent-kafka-python v2.7.0 is based on librdkafka v2.6.1, see the
[librdkafka release notes](https://github.com/confluentinc/librdkafka/releases/tag/v2.6.1)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v2.6.2

> [!WARNING]
> Due to an error in which we included dependency changes to a recent patch release, Confluent recommends users to **refrain from upgrading to 2.6.2** of Confluent Kafka. Confluent will release a new minor version, 2.7.0, where the dependency changes will be appropriately included. Users who have already upgraded to 2.6.2 and made the required dependency changes are free to remain on that version and are recommended to upgrade to 2.7.0 when that version is available. Upon the release of 2.7.0, the 2.6.2 version will be marked deprecated.
We apologize for the inconvenience and appreciate the feedback that we have gotten from the community.

v2.6.2 is a feature release with the following features, fixes and enhancements:

Note: This release modifies the dependencies of the Schema Registry client. 
If you are using the Schema Registry client, please ensure that you install the
extra dependencies using the following syntax:

```
pip install confluent-kafka[schemaregistry]
```

or

```
pip install confluent-kafka[avro,schemaregistry]
```

Please see the [README.md](README.md) for more information.

 - Support for Data Contracts with Schema Registry, including
   - Data Quality rules
   - Data Transformation rules
   - Client-Side Field Level Encryption (CSFLE)
   - Schema Migration rules (requires Python 3.9+)
 - Migrated the Schema Registry client from requests to httpx
 - Add support for multiple URLs (#409)
 - Allow configuring timeout (#622)
 - Fix deletion semantics (#1127)
 - Python deserializer can take SR client (#1174)
 - Fix handling of Avro unions (#1562)
 - Remove deprecated RefResolver for JSON (#1840)
 - Support delete of subject version (#1851)

confluent-kafka-python is based on librdkafka v2.6.1, see the
[librdkafka release notes](https://github.com/confluentinc/librdkafka/releases/tag/v2.6.1)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v2.6.1

v2.6.1 is a maintenance release with the following fixes and enhancements:

 - Migrated build system from `setup.py` to `pyproject.toml` in accordance with `PEP 517` and `PEP 518`, improving project configuration, build system requirements management, and compatibility with modern Python packaging tools like `pip` and `build`. (#1592)
 - Removed python 3.6 support. (#1592)
 - Added an example for OAUTH OIDC producer with support for confluent cloud (#1769, @sarwarbhuiyan)

confluent-kafka-python is based on librdkafka v2.6.1, see the
[librdkafka release notes](https://github.com/confluentinc/librdkafka/releases/tag/v2.6.1)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v2.6.0

v2.6.0 is a feature release with the following features, fixes and enhancements:

- Added Python 3.13 wheels (#1828).
- [KIP-848 EA](https://cwiki.apache.org/confluence/display/KAFKA/KIP-848%3A+The+Next+Generation+of+the+Consumer+Rebalance+Protocol): Admin API for listing consumer groups now has an optional filter to return only groups of given types (#1830).
- [KIP-460](https://cwiki.apache.org/confluence/display/KAFKA/KIP-460%3A+Admin+Leader+Election+RPC) Admin Leader Election RPC (#1818)
- Added Transactional id resource type for ACL operations (@JohnPreston, #1834).

confluent-kafka-python is based on librdkafka v2.6.0, see the
[librdkafka release notes](https://github.com/confluentinc/librdkafka/releases/tag/v2.6.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v2.5.3

v2.5.3 is a maintenance release with the following fixes and enhancements:

### Fixes

* Fix an assert being triggered during push telemetry call when no metrics matched on the client side.
* Minor enhancement to JSONDeserializer to retrieve schema from Schema Registry if not provided

confluent-kafka-python is based on librdkafka v2.5.3, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v2.5.3)
for a complete list of changes, enhancements, fixes and upgrade considerations.



## v2.5.0

> [!WARNING]
This version has introduced a regression in which an assert is triggered during **PushTelemetry** call. This happens when no metric is matched on the client side among those requested by broker subscription. 
>
> You won't face any problem if:
> * Broker doesn't support [KIP-714](https://cwiki.apache.org/confluence/display/KAFKA/KIP-714%3A+Client+metrics+and+observability).
> * [KIP-714](https://cwiki.apache.org/confluence/display/KAFKA/KIP-714%3A+Client+metrics+and+observability) feature is disabled on the broker side.
> * [KIP-714](https://cwiki.apache.org/confluence/display/KAFKA/KIP-714%3A+Client+metrics+and+observability) feature is disabled on the client side. This is enabled by default. Set configuration `enable.metrics.push` to `false`.
> * If [KIP-714](https://cwiki.apache.org/confluence/display/KAFKA/KIP-714%3A+Client+metrics+and+observability) is enabled on the broker side and there is no subscription configured there.
> * If [KIP-714](https://cwiki.apache.org/confluence/display/KAFKA/KIP-714%3A+Client+metrics+and+observability) is enabled on the broker side with subscriptions that match the [KIP-714](https://cwiki.apache.org/confluence/display/KAFKA/KIP-714%3A+Client+metrics+and+observability) metrics defined on the client.
> 
> Having said this, we strongly recommend using `v2.5.3` and above to not face this regression at all.

v2.5.0 is a feature release with the following features, fixes and enhancements:

 - [KIP-107](https://cwiki.apache.org/confluence/display/KAFKA/KIP-107%3A+Add+deleteRecordsBefore%28%29+API+in+AdminClient) Added delete_records API. (#1710)
 - Added an example to show the usage of the custom logger with `AdminClient`. (#1758)
 - Improve caching on Schema Registry client. (#1744)
 - Removed usage of `strcpy` to enhance security of the client. (#1745)
 - Removed support for centos6 and centos7. (#1776)
 - Fixed invalid write in `OAUTHBEARER/OIDC` extensions copy. (#1745)
 - Fixed documentation for default value of `operation_timeout` and `request_timeout` in various Admin apis. (#1710)
 - Fixed an issue related to import error of `TopicCollection` and `TopicPartitionInfo` classes when importing through other module like mypy. (#1764)
 - Fixed a segfault when `commit` or `store_offsets` consumer method is called incorrectly with errored Message object. (#1754)
 - Fixed `logger` not working when provided as an argument to `AdminClient` instead of a configuration property. (#1758)
 - Fixed some memory leaks related to `PyDict_SetItem`. (#1710)

confluent-kafka-python is based on librdkafka v2.5.0, see the
[librdkafka release notes](https://github.com/confluentinc/librdkafka/releases/tag/v2.5.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v2.4.0

v2.4.0 is a feature release with the following features, fixes and enhancements:

 - [KIP-848](https://cwiki.apache.org/confluence/display/KAFKA/KIP-848%3A+The+Next+Generation+of+the+Consumer+Rebalance+Protocol): Added KIP-848 based new consumer group rebalance protocol. The feature is an **Early Access**: not production ready yet. Please refer [detailed doc](https://github.com/confluentinc/librdkafka/blob/master/INTRODUCTION.md#next-generation-of-the-consumer-group-protocol-kip-848) for more information.
 - Fix segfault with describe_topics and flaky connection (@lpsinger, #1692)

confluent-kafka-python is based on librdkafka v2.4.0, see the
[librdkafka release notes](https://github.com/confluentinc/librdkafka/releases/tag/v2.4.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v2.3.0

v2.3.0 is a feature release with the following features, fixes and enhancements:

 - Add Python 3.12 wheels
 - [KIP-117](https://cwiki.apache.org/confluence/display/KAFKA/KIP-117%3A+Add+a+public+AdminClient+API+for+Kafka+admin+operations): Add support for AdminAPI `describe_cluster()` and `describe_topics()`. (@jainruchir, #1635)
 - [KIP-430](https://cwiki.apache.org/confluence/display/KAFKA/KIP-430+-+Return+Authorized+Operations+in+Describe+Responses):
   Return authorized operations in Describe Responses. (@jainruchir, #1635)
 - [KIP-516](https://cwiki.apache.org/confluence/display/KAFKA/KIP-516%3A+Topic+Identifiers): Partial support of topic identifiers. Topic identifiers in metadata response are available through the new describe_topics function (#1645).
 - [KIP-396](https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=97551484): completed the implementation with the addition of `list_offsets` (#1576).
 - Add `Rack` to the `Node` type, so AdminAPI calls can expose racks for brokers
   (currently, all Describe Responses) (#1635, @jainruchir).
 - Fix the Describe User Scram Credentials for Describe all users or empty users list. Please refer to
   issue(https://github.com/confluentinc/confluent-kafka-python/issues/1616) for more details (#1630).

confluent-kafka-python is based on librdkafka v2.3.0, see the
[librdkafka release notes](https://github.com/confluentinc/librdkafka/releases/tag/v2.3.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v2.2.0

v2.2.0 is a feature release with the following features, fixes and enhancements:

 - [KIP-339](https://cwiki.apache.org/confluence/display/KAFKA/KIP-339%3A+Create+a+new+IncrementalAlterConfigs+API)
   IncrementalAlterConfigs API (#1517).
 - [KIP-554](https://cwiki.apache.org/confluence/display/KAFKA/KIP-554%3A+Add+Broker-side+SCRAM+Config+API):
   User SASL/SCRAM credentials alteration and description (#1575).
 - Added documentation with an example of FIPS compliant communication with Kafka cluster.
 - Fixed wrong error code parameter name in KafkaError.

confluent-kafka-python is based on librdkafka v2.2.0, see the
[librdkafka release notes](https://github.com/confluentinc/librdkafka/releases/tag/v2.2.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v2.1.1

v2.1.1 is a maintenance release with the following fixes and enhancements:

### Fixes

- Added a new ConsumerGroupState UNKNOWN. The typo state UNKOWN is deprecated and will be removed in the next major version.
- Fix some Admin API documentation stating -1 for infinite timeout incorrectly.
  Request timeout can't be infinite.

confluent-kafka-python is based on librdkafka v2.1.1, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v2.1.1)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v2.1.0

v2.1.0 is a feature release with the following features, fixes and enhancements:

- Added `set_sasl_credentials`. This new method (on the Producer, Consumer, and AdminClient) allows modifying the stored
  SASL PLAIN/SCRAM credentials that will be used for subsequent (new) connections to a broker (#1511).
- Wheels for Linux / arm64 (#1496).
- Added support for Default num_partitions in CreateTopics Admin API.
- Added support for password protected private key in CachedSchemaRegistryClient.
- Add reference support in Schema Registry client. (@RickTalken, #1304)
- Migrated travis jobs to Semaphore CI (#1503)
- Added support for schema references. (#1514 and @slominskir #1088)
- [KIP-320](https://cwiki.apache.org/confluence/display/KAFKA/KIP-320%3A+Allow+fetchers+to+detect+and+handle+log+truncation):
  add offset leader epoch methods to the TopicPartition and Message classes (#1540).

confluent-kafka-python is based on librdkafka v2.1.0, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v2.1.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v2.0.2

v2.0.2 is a feature release with the following features, fixes and enhancements:

 - Added Python 3.11 wheels.
 - [KIP-222](https://cwiki.apache.org/confluence/display/KAFKA/KIP-222+-+Add+Consumer+Group+operations+to+Admin+API)
   Add Consumer Group operations to Admin API.
 - [KIP-518](https://cwiki.apache.org/confluence/display/KAFKA/KIP-518%3A+Allow+listing+consumer+groups+per+state)
   Allow listing consumer groups per state.
 - [KIP-396](https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=97551484)
   Partially implemented: support for AlterConsumerGroupOffsets.
 - As result of the above KIPs, added (#1449)
   - `list_consumer_groups` Admin operation. Supports listing by state.
   - `describe_consumer_groups` Admin operation. Supports multiple groups.
   - `delete_consumer_groups` Admin operation. Supports multiple groups.
   - `list_consumer_group_offsets` Admin operation. Currently, only supports 1 group with multiple partitions. Supports require_stable option.
   - `alter_consumer_group_offsets` Admin operation. Currently, only supports 1 group with multiple offsets.
 - Added `normalize.schemas` configuration property to Schema Registry client (@rayokota, #1406)
 - Added metadata to `TopicPartition` type and `commit()` (#1410).
 - Added `consumer.memberid()` for getting member id assigned to
   the consumer in a consumer group (#1154).
 - Implemented `nb_bool` method for the Producer, so that the default (which uses len)
   will not be used. This avoids situations where producers with no enqueued items would
   evaluate to False (@vladz-sternum, #1445).
 - Deprecated `AvroProducer` and `AvroConsumer`. Use `AvroSerializer` and `AvroDeserializer` instead.
 - Deprecated `list_groups`. Use `list_consumer_groups` and `describe_consumer_groups` instead.
 - Improved Consumer Example to show atleast once semantics.
 - Improved Serialization and Deserialization Examples.
 - Documentation Improvements.

## Upgrade considerations

OpenSSL 3.0.x upgrade in librdkafka requires a major version bump, as some
 legacy ciphers need to be explicitly configured to continue working,
 but it is highly recommended NOT to use them. The rest of the API remains
 backward compatible.

confluent-kafka-python is based on librdkafka 2.0.2, see the
[librdkafka v2.0.0 release notes](https://github.com/edenhill/librdkafka/releases/tag/v2.0.0)
and later ones for a complete list of changes, enhancements, fixes and upgrade considerations.

**Note: There were no v2.0.0 and v2.0.1 releases.**

## v1.9.2

v1.9.2 is a maintenance release with the following fixes and enhancements:

 - Support for setting principal and SASL extensions in oauth_cb
   and handle failures (@Manicben, #1402)
 - Wheel for macOS M1/arm64
 - KIP-140 Admin API ACL fix:
   When requesting multiple create_acls or delete_acls operations,
   if the provided ACL bindings or ACL binding filters are not
   unique, an exception will be thrown immediately rather than later
   when the responses are read. (#1370).
 - KIP-140 Admin API ACL fix:
   Better documentation of the describe and delete ACLs behavior
   when using the MATCH resource patter type in a filter. (#1373).
 - Avro serialization examples:
   added a parameter for using a generic or specific Avro schema. (#1381).

confluent-kafka-python is based on librdkafka v1.9.2, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v1.9.2)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v1.9.1

There was no 1.9.1 release of the Python Client.


## v1.9.0

This is a feature release:

 - OAUTHBEARER OIDC support
 - KIP-140 Admin API ACL support

### Fixes

 - The warnings for `use.deprecated.format` (introduced in v1.8.2)
   had its logic reversed, which result in warning logs to be emitted when
   the property was correctly configured, and the log message itself also
   contained text that had it backwards.
   The warning is now only emitted when `use.deprecated.format` is set
   to the old legacy encoding (`True`). #1265
 - Use `str(Schema)` rather than `Schema.to_json` to prevent fastavro
   from raising exception `TypeError: unhashable type: 'mappingproxy'`.
   (@ffissore, #1156, #1197)
 - Fix the argument order in the constructor signature for
   AvroDeserializer/Serializer: the argument order in the constructor
   signature for AvroDeserializer/Serializer was altered in v1.6.1, but
   the example is not changed yet. (@DLT1412, #1263)
 - Fix the json deserialization errors from `_schema_loads` for
   valid primitive declarations. (@dylrich, #989)

confluent-kafka-python is based on librdkafka v1.9.0, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v1.9.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v1.8.2

v1.8.2 is a maintenance release with the following fixes and enhancements:

 - **IMPORTANT**: Added mandatory `use.deprecated.format` to
   `ProtobufSerializer` and `ProtobufDeserializer`.
   See **Upgrade considerations** below for more information.
 - **Python 2.7 binary wheels are no longer provided.**
   Users still on Python 2.7 will need to build confluent-kafka from source
   and install librdkafka separately, see [README.md](README.md#Prerequisites)
   for build instructions.
 - Added `use.latest.version` and `skip.known.types` (Protobuf) to
   the Serializer classes. (Robert Yokota, #1133).
 - `list_topics()` and `list_groups()` added to AdminClient.
 - Added support for headers in the SerializationContext (Laurent Domenech-Cabaud)
 - Fix crash in header parsing (Armin Ronacher, #1165)
 - Added long package description in setuptools (Bowrna, #1172).
 - Documentation fixes by Aviram Hassan and Ryan Slominski.
 - Don't raise AttributeError exception when CachedSchemaRegistryClient
   constructor raises a valid exception.

confluent-kafka-python is based on librdkafka v1.8.2, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v1.8.2)
for a complete list of changes, enhancements, fixes and upgrade considerations.

**Note**: There were no v1.8.0 and v1.8.1 releases.


## Upgrade considerations

### Protobuf serialization format changes

Prior to this version the confluent-kafka-python client had a bug where
nested protobuf schemas indexes were incorrectly serialized, causing
incompatibility with other Schema-Registry protobuf consumers and producers.

This has now been fixed, but since the old defect serialization and the new
correct serialization are mutually incompatible the user of
confluent-kafka-python will need to make an explicit choice which
serialization format to use during a transitory phase while old producers and
consumers are upgraded.

The `ProtobufSerializer` and `ProtobufDeserializer` constructors now
both take a (for the time being) configuration dictionary that requires
the `use.deprecated.format` configuration property to be explicitly set.

Producers should be upgraded first and as long as there are old (<=v1.7.0)
Python consumers reading from topics being produced to, the new (>=v1.8.2)
Python producer must be configured with `use.deprecated.format` set to `True`.

When all existing messages in the topic have been consumed by older consumers
the consumers should be upgraded and both new producers and the new consumers
must set `use.deprecated.format` to `False`.


The requirement to explicitly set `use.deprecated.format` will be removed
in a future version and the setting will then default to `False` (new format).






## v1.7.0

v1.7.0 is a maintenance release with the following fixes and enhancements:

- Add error_cb to confluent_cloud.py example (#1096).
- Clarify that doc output varies based on method (@slominskir, #1098).
- Docs say Schema when they mean SchemaReference (@slominskir, #1092).
- Add documentation for NewTopic and NewPartitions (#1101).

confluent-kafka-python is based on librdkafka v1.7.0, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v1.7.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v1.6.1

v1.6.1 is a feature release:

 - KIP-429 - Incremental consumer rebalancing support.
 - OAUTHBEARER support.

### Fixes

 - Add `return_record_name=True` to AvroDeserializer (@slominskir, #1028)
 - Fix deprecated `schema.Parse` call (@casperlehmann, #1006).
 - Make reader schema optional in AvroDeserializer (@97nitt, #1000).
 - Add `**kwargs` to legacy AvroProducer and AvroConsumer constructors to
   support all Consumer and Producer base class constructor arguments, such
   as `logger` (@venthur, #699).
 - Add bool for permanent schema delete (@slominskir, #1029).
 - The avro package is no longer required for Schema-Registry support (@jaysonsantos, #950).
 - Only write to schema cache once, improving performance (@fimmtiu, #724).
 - Improve Schema-Registry error reporting (@jacopofar, #673).
 - `producer.flush()` could return a non-zero value without hitting the
   specified timeout.


confluent-kafka-python is based on librdkafka v1.6.1, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v1.6.1)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v1.6.0

v1.6.0 is a feature release with the following features, fixes and enhancements:

 - Bundles librdkafka v1.6.0 which adds support for Incremental rebalancing,
   Sticky producer partitioning, Transactional producer scalabilty improvements,
   and much much more. See link to release notes below.
 - Rename asyncio.py example to avoid circular import (#945)
 - The Linux wheels are now built with manylinux2010 (rather than manylinux1)
   since OpenSSL v1.1.1 no longer builds on CentOS 5. Older Linux distros may
   thus no longer be supported, such as CentOS 5.
 - The in-wheel OpenSSL version has been updated to 1.1.1i.
 - Added `Message.latency()` to retrieve the per-message produce latency.
 - Added trove classifiers.
 - Consumer destructor will no longer trigger consumer_close(),
   `consumer.close()` must now be explicitly called if the application
   wants to leave the consumer group properly and commit final offsets.
 - Fix `PY_SSIZE_T_CLEAN` warning
 - Move confluent_kafka/ to src/ to avoid pytest/tox picking up the local dir
 - Added `producer.purge()` to purge messages in-queue/flight (@peteryin21, #548)
 - Added `AdminClient.list_groups()` API (@messense, #948)
 - Rename asyncio.py example to avoid circular import (#945)

confluent-kafka-python is based on librdkafka v1.6.0, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v1.6.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.


## v1.5.2

v1.5.2 is a maintenance release with the following fixes and enhancements:

 - Add producer purge method with optional blocking argument (@peteryin21, #548)
 - Add AdminClient.list_groups API (@messense, #948)
 - Rename asyncio.py example to avoid circular import (#945)
 - Upgrade bundled OpenSSL to v1.1.1h (from v1.0.2u)
 - The Consumer destructor will no longer trigger `consumer.close()`
   callbacks, `consumer.close()` must now be explicitly called to cleanly
   close down the consumer and leave the group.
 - Fix `PY_SSIZE_T_CLEAN` warning in calls to produce().
 - Restructure source tree to avoid undesired local imports of confluent_kafka
   when running pytest.

confluent-kafka-python is based on librdkafka v1.5.2, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v1.5.2)
for a complete list of changes, enhancements, fixes and upgrade considerations.


**Note: There was no v1.5.1 release**


## v1.5.0

v1.5.0 is a maintenance release with the following fixes and enhancements:

 - Bundles librdkafka v1.5.0 - see release notes for all enhancements and fixes.
 - Documentation fixes
 - [Dockerfile examples](examples/docker)
 - [List offsets example](examples/list_offsets.py)

confluent-kafka-python is based on librdkafka v1.5.0, see the
[librdkafka release notes](https://github.com/edenhill/librdkafka/releases/tag/v1.5.0)
for a complete list of changes, enhancements, fixes and upgrade considerations.

